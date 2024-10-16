import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../size_config.dart';



class Catagories extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> catagories =[
      {"icon":"Assets/Icons/saleicon.svg","text":"hot deals"},
      {"icon":"Assets/Icons/gameicon.svg","text":"games"},
      {"icon":"Assets/Icons/hangericon.svg","text":"clothing"},
      {"icon":"Assets/Icons/booksicon.svg","text":"books"},
      {"icon":"Assets/Icons/miscellaneousicon.svg","text":"other"}
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(catagories.length,
                  (index) => catagoryCard(icon:catagories[index]["icon"],
                text:catagories[index]["text"],
                press:(){},))
        ],
      ),
    );
  }
}

class catagoryCard extends StatelessWidget {
  const catagoryCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press
  });

  final String icon,text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            InkWell(
              onTap: press,
              borderRadius:BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(icon),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(text,textAlign: TextAlign.center)
          ],
        ),
      );
  }
}
