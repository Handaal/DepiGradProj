import 'package:ecommercehome/screens/home_screen/components/specialstitle.dart';
import 'package:ecommercehome/screens/hoodies.dart';
import 'package:ecommercehome/screens/products.dart';
import 'package:ecommercehome/screens/sets.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';




class SpecialOffers extends StatelessWidget {
  final String token;

  const SpecialOffers({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpecialsIdentifier(
          text: "Today's Specials",
          press: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Products(token: token),
              ),
            );
          },
        ),
        SizedBox(height: getProportionateScreenWidth(15),),
        SingleChildScrollView(
          scrollDirection:Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Hoodies(token: token),
                    ),
                  );
                },
                child: specialofferscard(image:"Assets/images/pikasoedit.jpeg",
                  catagory:"Hoodies",
                  numofbrands:8,
                  press: (){},
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Sets(token: token),
                    ),
                  );
                },
                child: specialofferscard(image:"Assets/images/pikasoedit.jpeg",
                  catagory:"Sets",
                  numofbrands:7,
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
      padding: EdgeInsets.only(left:getProportionateScreenWidth(30)),
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