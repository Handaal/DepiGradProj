// ignore_for_file: prefer_const_constructors

import 'package:ecommercehome/features/onBoarding/content_model.dart';
import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                _controller?.jumpToPage(2);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 300),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(160, 0, 0, 0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_,i){
                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      // mainAxisAlignment: ,
                      children: [
                        // Text(
                        //   contents[i].title,
                        //   style: TextStyle(
                        //     fontSize: getProportionateScreenWidth(20),
                        //     fontWeight: FontWeight.bold,
                        //     color: kPrimaryColor,
                             
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                        Image.asset(
                          contents[i].image,
                          width: getProportionateScreenWidth(350),
                        ),
                        // SizedBox(
                        //   height: getProportionateScreenHeight(15),
                        // ),
                        
                        SizedBox(
                          width: getProportionateScreenWidth(300),
                          child: Text(
                            contents[i].description,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 117, 117, 117),
                            ),
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            
            GestureDetector(
              onTap: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushNamed(context, '/login');
                }
                _controller?.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              child: Container(
                margin: EdgeInsets.all(50),
                width: getProportionateScreenWidth(200),
                height: getProportionateScreenHeight(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: secondaryColor
                  // gradient: LinearGradient(
                  //   colors: const [
                  //     kPrimaryColor,
                  //     secondaryColor,
                  //     // kPrimaryColor,
                  //   ],
                  //   // begin: Alignment.topRight,
                  //   // end: Alignment.bottomLeft
                  // ),
                ),
                child: Center(
                  child: Text(
                    currentIndex == contents.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(
                      color: kPrimaryLightColor,
                      fontSize: getProportionateScreenWidth(17),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(8),
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kPrimaryColor,
      ),
    );
  }
}