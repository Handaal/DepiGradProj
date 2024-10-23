import 'dart:convert';
import 'package:ecommercehome/screens/productdetails.dart';
import 'package:ecommercehome/screens/products.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import '../../../features/register/toast.dart'; // Assuming you need this for error handling.

class Product {
  final int id;
  final String name;
  final int price;
  final String sex;
  final String image;
  final int quantity;
  final String category;
  final int brandId;
  final Brand brand;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.sex,
    required this.image,
    required this.quantity,
    required this.category,
    required this.brandId,
    required this.brand,
  });
}

class Brand {
  final String name;
  Brand({required this.name});
}

class HorizontalProductList extends StatefulWidget {
  final String token;

  const HorizontalProductList({super.key, required this.token});

  @override
  _HorizontalProductListState createState() => _HorizontalProductListState();
}

class _HorizontalProductListState extends State<HorizontalProductList> {
  List<Product> products = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/product/displayAll');

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': widget.token, 'Content-Type': 'application/json'},
      );

      final decodedBody = json.decode(response.body);

      if (decodedBody['statusCode'] == 200) {
        setState(() {
          products = parseProducts(List<Map<String, dynamic>>.from(decodedBody['data']))
              .take(4) // Only take the first 4 products.
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
        showToast(message: "Failed to load products");
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      showToast(message: "Error fetching products");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular Products",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Products(token: widget.token),
                    ),
                  );
                },
                child: const Text(
                  "View More",
                  style: TextStyle(
                    fontSize: 14,
                    color: secondaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),


          isLoading
              ? const Center(child: CircularProgressIndicator())
              : hasError
                  ? const Center(child: Text("Failed to load products"))
                  : SizedBox(
                      height: 250, 
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(token: widget.token,product: products[index]);
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product, required this.token,
  });

  final Product product;
  final String token;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProductDetailsPage(token: token,productId: product.id,),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  product.image,
                  height: 150,
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      "Price: \$${product.price}",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

// Parsing function.
List<Product> parseProducts(List<Map<String, dynamic>> productList) {
  return productList.map((data) {
    return Product(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      sex: data['sex'],
      image: data['image'],
      quantity: data['quantity'],
      category: data['category'],
      brandId: data['brandId'],
      brand: Brand(name: data['brand']['name']),
    );
  }).toList();
}
