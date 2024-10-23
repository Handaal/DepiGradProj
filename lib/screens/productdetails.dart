// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../features/register/toast.dart';
import '../utils/constants.dart';

class Product {
  final int id;
  final String name;
  final int price;
  final String sex;
  final String image;
  final int quantity;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.sex,
    required this.image,
    required this.quantity,
    required this.category,
  });
}



class ProductDetailsPage extends StatefulWidget {
  final int productId;
  final String token;

  const ProductDetailsPage({super.key, required this.productId, required this.token});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isLoading = true;
  bool hasError = false;
  Product? product;

  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/product/display');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': widget.token,
        },
        body: jsonEncode(<String, int>{
          'id': widget.productId,
        }),
      );

      final decodedBody = json.decode(response.body);
      
      if (decodedBody['statusCode'] == 200) {
        setState(() {
          product = parseProduct(decodedBody['data']);
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
        showToast(message: "Failed to load product details");
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      showToast(message: "Error: Displaying Product");
    }
  }

  Product parseProduct(Map<String, dynamic> data) {
  return Product(
    id: data['id'],
    name: data['name'],
    price: data['price'],
    sex: data['sex'],
    image: data['image'],
    quantity: data['quantity'],
    category: data['category'],
  );
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Product Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold            
            ),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
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
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : hasError
                ? const Center(child: Text('Error loading product details'))
                : Stack(
                  children: [
      
                    SizedBox(
                      height: getProportionateScreenHeight(400),
                      width: SizeConfig.screenWidth,
                      child: Image.network(
                        product!.image,
                        height: getProportionateScreenHeight(400),
                        width: SizeConfig.screenWidth,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(top: 380.0),
                      child: Container(
                        height: SizeConfig.screenHeight,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20, top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              // SizedBox(
                              //   height: getProportionateScreenHeight(20),
                              // ),
                              Text(
                                product!.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              Text(
                                'Category: ${product!.category}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Text(
                                'Price: \$${product!.price}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // const SizedBox(height: 8),
                              // Text(
                              //   'Available Quantity: ${product!.quantity}',
                              //   style: const TextStyle(fontSize: 16),
                              // ),
                              // const SizedBox(height: 8),
                              // Text(
                              //   'For: ${product!.sex == 'M' ? 'Men' : 'Women'}',
                              //   style: const TextStyle(fontSize: 16),
                              // ),
                              SizedBox(
                                height: getProportionateScreenHeight(40),
                              ),
                              Center(
                                child: SizedBox(
                                  height: getProportionateScreenHeight(40),
                                  width: getProportionateScreenWidth(200),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                        
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          
                                        ),
                                      ),
                                      
                                      onPressed: () => _addToCart(context,product!.id),
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
