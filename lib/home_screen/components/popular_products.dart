import 'package:ecommercehome/home_screen/components/product_card.dart';
import 'package:ecommercehome/home_screen/components/specialstitle.dart';
import 'package:flutter/material.dart';

import '../../Models/Product.dart';
import '../../size_config.dart';



class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        specialsIdentifier(
            text: "Popular Products",
            press: (){}),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(products.length,
                      (index) => ProductCard(product:products[index])
              ),
              SizedBox(width: getProportionateScreenWidth(20),)
            ],
          ),
        ),
      ],
    );
  }
}