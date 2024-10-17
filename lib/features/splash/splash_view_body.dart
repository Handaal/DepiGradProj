import 'package:ecommercehome/features/onBoarding/on_boarding_body.dart';
import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        color: secondaryColor,
        child: AnimatedSplashScreen(
          splash: Image.asset("Assets/images/TrendyMart (1).png"),
          backgroundColor: const Color(0x00429493),
          splashIconSize: getProportionateScreenWidth(500),
          duration: 1500,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: const OnBoardingView(),
          animationDuration: const Duration(seconds: 1),
        
        ),
      ),
    );
  }
}