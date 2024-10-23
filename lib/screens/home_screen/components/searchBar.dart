// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/screens/home_screen/components/search_result.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';





class Searchbar extends StatelessWidget {
  const Searchbar({super.key, required this.token});

  final String token;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => SearchResult(token: token),
          ),
        );
      },
      child: Container(
        width: getProportionateScreenWidth(330),
        height: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
            color:kSecondaryColor.withOpacity(0.09),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: secondaryColor,
            )
        ),
        child: Row(
          children: [
    
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
    
            Icon(
              Icons.search,
            ),
    
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
    
            Text(
              "Search for products",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,                               
              ),
            ),
    
          ],
        ),
      ),
    );
  }
}



