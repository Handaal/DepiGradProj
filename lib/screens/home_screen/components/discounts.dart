// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';



class Discounts extends StatelessWidget {
  const Discounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(147, 97, 97, 97),
            offset: Offset(4.0, 4.0),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          )
        ]
      ),
      child: const Text.rich(
          TextSpan(text:"Enjoy up to 20% off this summer\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(text: "20% off purchases with QNB",
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))
              ]
          )
      ),
    );
  }
}