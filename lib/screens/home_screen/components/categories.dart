import 'package:ecommercehome/screens/hoodies.dart';
import 'package:ecommercehome/screens/pants.dart';
import 'package:ecommercehome/screens/sets.dart';
import 'package:ecommercehome/screens/tshirts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/size_config.dart';

class Categories extends StatelessWidget {
  final String token;

  const Categories({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      // {
      //   "icon": "Assets/Icons/saleicon.svg",
      //   "text": "Hot Deals",
      //   "page": (String token) => Deals(),
      // },
      {
        "icon": "Assets/Icons/tshirt-svgrepo-com.svg",
        "text": "T-shirts",
        "page": (String token) => Tshirts(token: token),
      },
      {
        "icon": "Assets/Icons/hoodie-svgrepo-com.svg",
        "text": "Hoodies",
        "page": (String token) => Hoodies(token: token),
      },
      {
        "icon": "Assets/Icons/pants-svgrepo-com.svg",
        "text": "Pants",
        "page": (String token) => Pants(token: token),
      },
      {
        "icon": "Assets/Icons/hangericon.svg",
        "text": "Sets",
        "page": (String token) => Sets(token: token),
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        categories[index]["page"](token), // Call the constructor
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(55),
      child: Column(
        children: [
          InkWell(
            onTap: press,
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(25, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
