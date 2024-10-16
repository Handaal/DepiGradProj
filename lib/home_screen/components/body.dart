import 'dart:ffi';

import 'package:ecommercehome/Models/Product.dart';
import 'package:ecommercehome/constants.dart';
import 'package:ecommercehome/home_screen/components/popular_products.dart';
import 'package:ecommercehome/home_screen/components/product_card.dart';
import 'package:ecommercehome/home_screen/components/special_offers.dart';
import 'package:ecommercehome/home_screen/components/specialstitle.dart';
import 'package:ecommercehome/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Catagories.dart';
import 'discounts.dart';
import 'homeHead.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          homeHead(),
          SizedBox(height: getProportionateScreenWidth(30)),
          discounts(),
          SizedBox(height: getProportionateScreenWidth(30)),
          Catagories(),
          SizedBox(height: getProportionateScreenWidth(30)),
          specialOffers(),
          SizedBox(height: getProportionateScreenWidth(30)),
          PopularProducts(),
        ],
      ),
    ));
  }
}






