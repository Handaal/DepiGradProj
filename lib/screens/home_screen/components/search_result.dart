import 'dart:convert';
import 'package:ecommercehome/screens/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecommercehome/features/register/toast.dart';
import 'package:ecommercehome/utils/constants.dart';

class SearchResult extends StatefulWidget {
  final String token;

  const SearchResult({super.key, required this.token});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Product> items = [];
  final TextEditingController searchController = TextEditingController();
  Map<int, int> cart = {}; // Track product ID and quantity

  @override
  void initState() {
    super.initState();
    _displaySearchedProducts(); // Load products on init
  }

  Future<void> _displaySearchedProducts() async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/product/search');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{'keyword': searchController.text}),
    );

    final decodedBody = json.decode(response.body);

    if (decodedBody['statusCode'] == 200 && decodedBody['data'] is List) {
      final List<Map<String, dynamic>> fetchedItems =
          List<Map<String, dynamic>>.from(decodedBody['data']);
      setState(() {
        items = parseProducts(fetchedItems);
      });
    } else {
      showToast(message: "Error loading products");
    }
  }

  Future<void> _addToCart(BuildContext context,int productId) async {
    final Uri urll = Uri.parse('http://10.0.2.2:3000/cart/add/$productId');
    
    final response = await http.post(
      urll,
      headers: {'Content-Type': 'application/json; charset=UTF-8'
      ,'Authorization': widget.token,
      },
    );

    final decodedBody = json.decode(response.body);
    if (decodedBody['statusCode'] == 200) {
      showToast(message: "Product Added to cart");
    } else {
      showToast(message: "Error loading products");
    }
  }

  // void _incrementQuantity(int productId) {
  //   setState(() {
  //     cart[productId] = (cart[productId] ?? 0) + 1;
  //   });
  // }

  // void _decrementQuantity(int productId) {
  //   setState(() {
  //     if (cart[productId] != null && cart[productId]! > 1) {
  //       cart[productId] = cart[productId]! - 1;
  //     } else {
  //       cart.remove(productId);
  //     }
  //   });
  // }

  // void _removeFromCart(Product item) {
  //   if (cart[item.id] != null && cart[item.id]! > 0) {
  //     setState(() {
  //       cart.remove(item.id);
  //     });
  //     showToast(message: "Removed ${item.name} from cart");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: TextField(
            controller: searchController,
            onChanged: (value) => _displaySearchedProducts(),
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Search for a product...",
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: TextStyle(color: Colors.white),
          ),
          elevation: 2,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: items.isEmpty
            ? Center(child: Text("No products found"))
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 340,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Product item = items[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(token: widget.token,productId: item.id,),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Brand: ${item.brand.name}',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Price: \$${item.price}',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     IconButton(
                              //       icon: Icon(Icons.remove),
                              //       onPressed: () => _decrementQuantity(item.id),
                              //     ),
                              //     Text(
                              //       '${cart[item.id] ?? 0}',
                              //       style: TextStyle(fontSize: 16),
                              //     ),
                              //     IconButton(
                              //       icon: Icon(Icons.add),
                              //       onPressed: () => _incrementQuantity(item.id),
                              //     ),
                              //     IconButton(
                              //       icon: Icon(Icons.delete),
                              //       color: Colors.red,
                              //       onPressed: () => _removeFromCart(item),
                              //     ),
                              //   ],
                              // ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () => _addToCart(context,item.id),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

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

class Product {
  final int id;
  final String name;
  final int price;
  final String sex;
  final String image;
  int quantity; // Mutable quantity
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
