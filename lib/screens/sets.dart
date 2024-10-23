// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';

import 'package:ecommercehome/features/register/toast.dart';
import 'package:ecommercehome/screens/productdetails.dart';
import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class Sets extends StatefulWidget {
  final String token;

  const Sets({super.key, required this.token});
  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {
  List<Product> items = [];
  Map<int, int> cart = {}; // Track product ID and quantity

  @override
  void initState() {
    super.initState();
    _DisplayShirts(context);
  }

  Future<void> _DisplayShirts(BuildContext context) async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/product/category');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "authorization":widget.token,
      }, body: jsonEncode(<String, dynamic>{
        "category":"Sets"
      },
    ));

    final Map<String, dynamic> decodedBody = json.decode(response.body);
    final int? statusCode = decodedBody['statusCode'];
    // final String? message = decodedBody['message'];
    
    // Check if 'data' key exists and if it's a non-null list
    if (decodedBody.containsKey('data') && decodedBody['data'] is List) {
      final List<Map<String, dynamic>> fetchedItems =
        List<Map<String, dynamic>>.from(decodedBody['data']);

    // print(fetchedItems);

      if (statusCode == 200) {
        setState(() {
          items = parseProducts(fetchedItems);
        });
        // showToast(message: "$message");
      } else {
        // showToast(message: "Error $message");
        setState(() {
          items = parseProducts(fetchedItems);
        });
      }
    } else {
      showToast(message: "Invalid data received");
    }
  }

  Future<void> _addToCart(BuildContext context,int productId) async {
    final Uri urll = Uri.parse('http://10.0.2.2:3000/cart/add/${productId}');
    
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

  // void _removeFromCart(int productId) {
  //   setState(() {
  //     cart.remove(productId);
  //   });
  // }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sets", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )),
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
          elevation: 2,
        ),
        body: Padding(
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                          style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     // IconButton(
                        //     //   icon: Icon(Icons.remove, color: Colors.red),
                        //     //   onPressed: () => _decrementQuantity(item.id),
                        //     // ),
                        //     // Text(
                        //     //   '${cart[item.id] ?? 0}',
                        //     //   style: TextStyle(fontSize: 16),
                        //     // ),
                        //     // IconButton(
                        //     //   icon: Icon(Icons.add, color: Colors.green),
                        //     //   onPressed: () => _incrementQuantity(item.id),
                        //     // ),
                        //     // IconButton(
                        //     //   icon: Icon(Icons.delete, color: Colors.red),
                        //     //   onPressed: () => _removeFromCart(item.id),
                        //     // ),
                        //   ],
                        // ),
                        SizedBox(height: 8),
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
