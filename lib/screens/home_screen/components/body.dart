
import 'package:ecommercehome/screens/home_screen/components/product_card.dart';
import 'package:ecommercehome/screens/home_screen/components/searchBar.dart';
import 'package:ecommercehome/screens/home_screen/components/special_offers.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discounts.dart';
import 'homeHead.dart';


class Body extends StatelessWidget {
  final String token;

  const Body({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          const homeHead(),
          SizedBox(height: getProportionateScreenWidth(20)),
          Searchbar(token: token),
          SizedBox(height: getProportionateScreenWidth(30)),
          const Discounts(),
          SizedBox(height: getProportionateScreenWidth(30)),
          Categories(token: token),
          SizedBox(height: getProportionateScreenWidth(30)),
          SpecialOffers(token: token,),
          SizedBox(height: getProportionateScreenWidth(30)),
          HorizontalProductList(token: token),
        ],
      ),
    ));
  }
}






