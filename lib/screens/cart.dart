// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Cart",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/bottomNavBar");
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 1,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            // Product 1
            CartProduct(
              productName: "Nike Sportswear Hoodie",
              productPrice: 189.99,
              productQuantity: 2,
              imagePath: 'Assets/images/hoodie.png',
            ),
            // Product 2
            CartProduct(
              productName: "Nike Air Force 1",
              productPrice: 214.99,
              productQuantity: 1,
              imagePath: 'Assets/images/air force.png',
            ),
            // Product 3
            CartProduct(
              productName: "Portable Charger",
              productPrice: 124.50,
              productQuantity: 3,
              imagePath: 'Assets/images/charger.jpeg',
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            // Checkout button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: secondaryColor,
                    duration: Duration(seconds: 4),
                    content: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 30),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Thank you for shopping with us! Your order is on its way 🚚",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(getProportionateScreenWidth(10)),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(80),
                  vertical: getProportionateScreenHeight(15),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Checkout Now!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.imagePath,
  });

  final String productName;
  final double productPrice;
  final int productQuantity;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(15),
      ),
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(53, 92, 14, 188),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          Image.asset(
            imagePath,
            width: getProportionateScreenWidth(90),
            height: getProportionateScreenHeight(80),
            fit: BoxFit.cover,
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  "Price: \$${productPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  "Quantity: $productQuantity",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
