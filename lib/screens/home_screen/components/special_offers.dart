import 'package:ecommercehome/screens/home_screen/components/specialstitle.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';




class specialOffers extends StatelessWidget {
  const specialOffers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        specialsIdentifier(
          text: "Today's Specials",
          press: (){
            Navigator.pushNamed(context, "/products");
          },
        ),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection:Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/electronics");
                },
                child: specialofferscard(image:"Assets/images/electronicsbanner.png",
                  catagory:"Electronics",
                  numofbrands:18,
                  press: (){},
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/fashion");
                },
                child: specialofferscard(image:"Assets/images/pikasoedit.jpeg",
                  catagory:"Fashion",
                  numofbrands:26,
                  press: (){},
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(20),)
            ],
          ),
        ),
      ],
    );
  }
}

class specialofferscard extends StatelessWidget {
  const specialofferscard({
    super.key,
    required this.catagory,
    required this.image,
    required this.numofbrands,
    required this.press,
  });
  final String catagory,image;
  final int numofbrands;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(242),
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              const AspectRatio(aspectRatio: 2.4),
              Image.asset(
                image,
                fit: BoxFit.cover,),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[ const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15)
                      ],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15)),
                child: Text.rich(
                    TextSpan(
                        style: const TextStyle(color: Colors.white),
                        children:[
                          TextSpan(text: "$catagory\n",
                              style:TextStyle(fontSize:getProportionateScreenWidth(25),
                                  fontWeight: FontWeight.bold)),
                          TextSpan(text: "$numofbrands brands")
                        ]
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}