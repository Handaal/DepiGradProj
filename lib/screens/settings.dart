// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
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
              "Under Development",
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