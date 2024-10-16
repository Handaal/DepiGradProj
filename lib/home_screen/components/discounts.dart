import 'package:flutter/material.dart';

import '../../size_config.dart';



class discounts extends StatelessWidget {
  const discounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)
      ),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.orangeAccent
          ,borderRadius: BorderRadius.circular(20)),
      child: Text.rich(
          TextSpan(text:"Enjoy up to 20% off this summer\n",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(text: "20% off purchases with QNB",
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))
              ]
          )
      ),
    );
  }
}