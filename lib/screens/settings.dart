// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/screens/orders.dart';
import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final String token;

  const Settings({super.key, required this.token});


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OrderHistoryPage(token: widget.token),
                    ),
                  );
                },
                child: Container(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: secondaryColor
                    ),
                    
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Color.fromARGB(147, 97, 97, 97),
                    //     offset: Offset(4.0, 0),
                    //     blurRadius: 5.0,
                    //     spreadRadius: 1.0,
                    //     blurStyle: BlurStyle.normal
                    //   )
                    // ]
                  ),
                  child: Center(child: Text(
                    "Order History",
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: getProportionateScreenHeight(20),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Container(
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(300),
                  decoration: BoxDecoration(
                    // color: secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: secondaryColor
                    )
                  ),
                  child: Center(child: Text(
                    "Logout",
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}