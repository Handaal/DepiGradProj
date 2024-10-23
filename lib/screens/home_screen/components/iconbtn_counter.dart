
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class iconbtn_counter extends StatelessWidget {
  const iconbtn_counter({
    super.key, required this.svgSrc, this.numofitems=0, required this.press,
  });
  final String svgSrc;
  final int numofitems;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
            width: getProportionateScreenWidth(35),
            height: getProportionateScreenHeight(35),
            decoration: const BoxDecoration(
              // color:kSecondaryColor.withOpacity(0.1),
              shape:BoxShape.circle
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numofitems!=0)
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                width: getProportionateScreenWidth(16),
                height:getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(width:1.5,color:Colors.white),
                ),
                child: Center(
                  child: Text("$numofitems",style: TextStyle(fontSize: getProportionateScreenWidth(10),
                      height:1,
                      color:Colors.white,
                      fontWeight: FontWeight.w600)),
                ),
              ),
            )
        ],
      ),
    );
  }
}
