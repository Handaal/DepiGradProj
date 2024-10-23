import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';


class SpecialsIdentifier extends StatelessWidget {
  const SpecialsIdentifier({
    super.key,
    required this.text,
    required this.press
  });
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const Text(
           "Today's Special",
           style: TextStyle(
             fontSize: 18,
             color: secondaryColor,
             fontWeight: FontWeight.bold,
           ),
         ),
          GestureDetector(
            onTap: press,
            child:const Text(
              "View More",
              style: TextStyle(
                fontSize: 14,
                color: secondaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}