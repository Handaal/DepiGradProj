// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

class Deals extends StatelessWidget {
  const Deals({super.key});

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hot Deals!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/bottomNavBar");
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 1,
          automaticallyImplyLeading: false,
        ),
        
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Colors.transparent
          ),
          child: Center(
            child: Text(
              "There are no deals for now/nCome Back Later!",
              style: TextStyle(
                fontSize: 18,              
              ),
            ),
          ),
        ),
      ),
    );
  }
}