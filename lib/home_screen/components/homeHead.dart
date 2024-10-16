import 'package:ecommercehome/home_screen/components/searchBar.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'iconbtn_counter.dart';


class homeHead extends StatelessWidget {
  const homeHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchBar(),
          iconbtn_counter(
            svgSrc: "Assets/Icons/cart.svg",
            numofitems:6,
            press: (){},
          ),
          iconbtn_counter(
            svgSrc: "Assets/Icons/bell.svg",
            numofitems:2,
            press: (){},
          )
        ],
      ),
    );
  }
}
