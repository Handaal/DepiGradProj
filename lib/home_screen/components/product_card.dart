import 'package:flutter/material.dart';

import '../../Models/Product.dart';
import '../../constants.dart';
import '../../size_config.dart';



class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width=140,
    this.aspect=1.02,
    this.height=250,
    required this.product,
  });
  final double width,aspect,height;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:getProportionateScreenWidth(20)),
      child: SizedBox(
        width:getProportionateScreenWidth(width),
        height:getProportionateScreenWidth(height),
        child: Column(
          children: [
            AspectRatio(aspectRatio: aspect
              ,child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
            ),
            Text(product.title,
              style: TextStyle(color: Colors.black),maxLines:2,
            ),
            Text("${product.price}",
              style: TextStyle(fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}