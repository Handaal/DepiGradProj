import 'package:flutter/material.dart';


class Product{
  final String title,description;
  final List<String> images;
  final List<Color> colors;
  final double rating,price;
  final bool isFavourite,isPopular;

  Product({
  required this.title,
  required this.description,
  required this.images,
  required this.colors,
  required  this.price,
  this.rating=0.0,
  this.isFavourite=false,
  this.isPopular=false,

});
}

List<Product> products = [
  Product(
    images: [
      "Assets/images/dualsense.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS5™",
    price: 2499.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "Assets/images/nikesneaker.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike sneaker",
    price: 4999.99,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    images: [
      "Assets/images/quest2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "oculus quest 2 vrheadset",
    price: 14499.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "Assets/images/sonywalkman.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Sony walkman",
    price: 7799.99,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
