import 'package:flutter/material.dart';


class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedImageIndex = 0;
  int selectedColorIndex = 0;


  // List of product images and colors
  final List<String> productImages = [
    'https://m.media-amazon.com/images/I/71aDZGDOwlL._AC_SX425_.jpg',
    'https://m.media-amazon.com/images/I/618zZ7u3sUL.__AC_SX300_SY300_QL70_FMwebp_.jpg',
    'https://m.media-amazon.com/images/I/71QDJHG1PqL.__AC_SX300_SY300_QL70_FMwebp_.jpg',
    'https://m.media-amazon.com/images/I/817vi8DaEKL._AC_UY218_.jpg',
    'https://m.media-amazon.com/images/I/51K1mE5uVyL._AC_UY218_.jpg',
  ];

  final List<Color> productColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.94),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Text(
                  "4.5",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
          )
        ],
      ),



      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main product image
          Center(
            child: Image.network(

              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress)
              {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                child: Text("loading lol", style: TextStyle(fontSize: 20),),
              );
              },




              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace)
              {
                return const Center(
                  child: Text("no internet lol", style: TextStyle(fontSize: 20),),
                );
              },


              productImages[selectedImageIndex],
              height: 400,
              width: 800,
              // fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),


          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productImages.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedImageIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedImageIndex == index
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  child: Image.network(


                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress)
                    {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: Text("loading lol", style: TextStyle(fontSize: 20),),
                      );
                    },




                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace)
                    {
                      return const Center(
                        child: Text("no internet lol", style: TextStyle(fontSize: 20),),
                      );
                    },


                    productImages[index],
                    height: 100,
                    width: 100,
                    // fit: BoxFit.cover,
                  ),
                ),
              )

            ),
          ),



          const SizedBox(height: 16),








          Container(
            width: double.infinity,
            // margin: EdgeInsets.all(4),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), // Rounded corners
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.4), // Shadow color
              //     spreadRadius: 4, // How wide the shadow spreads
              //     blurRadius: 3, // Blurring radius of the shadow
              //     offset: Offset(0, 3), // Position of the shadow
              //   ),
              // ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Product Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "This product is designed to bring the best experience for users, with elegant design and high performance. It is crafted using top-notch materials, offering durability and style. Perfect for those looking for quality and aesthetic appeal.",
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),








          // Product description
          // Text(
          //   "This is a beautiful product that offers a perfect blend of elegance and utility. "
          //       "Crafted with precision, it adds charm to your lifestyle. Available in multiple colors.",
          //   style: TextStyle(
          //     fontSize: 18,
          //     height: 1.5,
          //     color: Colors.grey[700],
          //   ),
          // ),



          // Color selection
          Container(

            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),),),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(productColors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedColorIndex == index ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: productColors[index],
                      radius: 20,
                    ),
                  ),
                );
              }),
            ),
          ),


          //just to get the screen size
          // Text("${MediaQuery.of(context).size.height} ////// ${MediaQuery.of(context).size.width}"),

          // Add to cart button
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle add to cart functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


















