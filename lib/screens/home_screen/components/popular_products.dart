import 'package:ecommercehome/screens/home_screen/components/product_card.dart';
import 'package:ecommercehome/screens/home_screen/components/specialstitle.dart';
import 'package:flutter/material.dart';

import '../../../Models/product.dart';
import '../../../utils/size_config.dart';



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
            
            press: (){
              Navigator.pushNamed(context, "/products");
            }),
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