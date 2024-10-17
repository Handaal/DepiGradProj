// // ignore_for_file: prefer_const_constructors

// import 'package:ecommercehome/utils/constants.dart';
// import 'package:ecommercehome/utils/size_config.dart';
// import 'package:flutter/material.dart';

// class Books extends StatelessWidget {
//   const Books({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List of book images and their corresponding details
//     final List<Map<String, dynamic>> books = [
//       {"name": "Book Title 1", "price": 29.99, "imagePath": "Assets/images/book1.jpg"},
//       {"name": "Book Title 2", "price": 34.99, "imagePath": "Assets/images/book2.png"},
//       {"name": "Book Title 3", "price": 39.99, "imagePath": "Assets/images/book3.jpg"},
//       {"name": "Book Title 4", "price": 44.99, "imagePath": "Assets/images/book4.jpg"},
//       {"name": "Book Title 5", "price": 49.99, "imagePath": "Assets/images/book5.jpg"},
//       {"name": "Book Title 6", "price": 54.99, "imagePath": "Assets/images/book6.jpg"},
//       {"name": "Book Title 7", "price": 59.99, "imagePath": "Assets/images/book7.jpeg"},
//     ];

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Books",
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(context, "/bottomNavBar");
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: kPrimaryColor,
//           elevation: 1,
//           automaticallyImplyLeading: false,
//         ),
        
//         body: Padding(
//           padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//           child: GridView.builder(
//             itemCount: books.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: getProportionateScreenHeight(10),
//               crossAxisSpacing: getProportionateScreenWidth(10),
//               childAspectRatio: 0.7,
//             ),
//             itemBuilder: (context, index) {
//               return BookItem(
//                 bookName: books[index]["name"],
//                 bookPrice: books[index]["price"],
//                 imagePath: books[index]["imagePath"],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BookItem extends StatelessWidget {
//   const BookItem({
//     super.key,
//     required this.bookName,
//     required this.bookPrice,
//     required this.imagePath,
//   });

//   final String bookName;
//   final double bookPrice;
//   final String imagePath;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: const Color.fromARGB(53, 92, 14, 188)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 5,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             imagePath,
//             width: double.infinity,
//             height: getProportionateScreenHeight(120),
//             fit: BoxFit.cover,
//           ),
//           SizedBox(height: getProportionateScreenHeight(10)),
//           Text(
//             bookName,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SizedBox(height: getProportionateScreenHeight(5)),
//           Text(
//             "\$${bookPrice.toStringAsFixed(2)}",
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: getProportionateScreenHeight(10)),
//           ElevatedButton(
//             onPressed: () {
//               // Static "Add to Cart" button without functionality
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: kPrimaryColor,
//               padding: EdgeInsets.symmetric(
//                 horizontal: getProportionateScreenWidth(5),
//                 vertical: getProportionateScreenHeight(5),
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: Text(
//               "Add to Cart",
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
