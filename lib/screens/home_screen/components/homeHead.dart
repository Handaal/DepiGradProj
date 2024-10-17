// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import 'iconbtn_counter.dart';


class homeHead extends StatelessWidget {
  const homeHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // searchBar(),
          // Image.asset(
          //   "Assets/images/logo2.png",
          //   width: getProportionateScreenWidth(150),
          // ),

          Text(
            "TrendyMart",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "apricot",
              color: secondaryColor,
            ),
          ),

          SizedBox(
            width: getProportionateScreenWidth(150),
          ),

          iconbtn_counter(
            svgSrc: "Assets/Icons/cart.svg",
            numofitems:6,
            press: (){
              Navigator.pushNamed(context, "/cart");
            },
          ),
          iconbtn_counter(
            svgSrc: "Assets/Icons/bell.svg",
            numofitems:2,
            press: (){
              Navigator.pushNamed(context, "/notifications");
            },
          )
        ],
      ),
    );
  }
}
