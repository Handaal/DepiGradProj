// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';


class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:SizeConfig.screenWidth*0.9,
      height: getProportionateScreenHeight(40),
      decoration: BoxDecoration(
          color:kSecondaryColor.withOpacity(0.09),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color.fromARGB(113, 44, 0, 98),
          )
      ),
      child:  TextField(
        onChanged: (value){
          //product searched
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "search for a product",
          hintStyle: TextStyle(
            color: const Color.fromARGB(167, 0, 0, 0),
            fontSize: 14
          ),
          prefixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenWidth(12)
          )
        ),
      ),
    );
  }
}
