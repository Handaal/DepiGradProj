
import 'package:ecommercehome/screens/home_screen/components/popular_products.dart';
import 'package:ecommercehome/screens/home_screen/components/searchBar.dart';
import 'package:ecommercehome/screens/home_screen/components/special_offers.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discounts.dart';
import 'homeHead.dart';


class Body extends StatelessWidget {
  const Body({super.key});

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
          const searchBar(),
          SizedBox(height: getProportionateScreenWidth(30)),
          const Discounts(),
          SizedBox(height: getProportionateScreenWidth(30)),
          const Categories(),
          SizedBox(height: getProportionateScreenWidth(30)),
          const specialOffers(),
          SizedBox(height: getProportionateScreenWidth(30)),
          const PopularProducts(),
        ],
      ),
    ));
  }
}






