import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "Assets/Icons/saleicon.svg", "text": "Hot Deals", "route": "/deals"},
      {"icon": "Assets/Icons/gameicon.svg", "text": "Games", "route": "/electronics"},
      {"icon": "Assets/Icons/hangericon.svg", "text": "Fashion", "route": "/fashion"},
      {"icon": "Assets/Icons/booksicon.svg", "text": "Books", "route": "/books"},
      {"icon": "Assets/Icons/miscellaneousicon.svg", "text": "Other", "route": "/other"}
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              press: () {
                // Navigate to the specific route based on the index or route defined in the list
                Navigator.pushNamed(context, categories[index]["route"]);
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
