import 'package:ecommercehome/features/onBoarding/on_boarding_body.dart';
// import 'package:ecommercehome/features/register/login.dart'; // Import your Login page here
import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool? isFirstLaunch; // Nullable to check before initializing.

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final firstLaunch = prefs.getBool('isFirstLaunch');

    // Log the result for debugging
    print("First launch: $firstLaunch");

    if (firstLaunch == null || firstLaunch) {
      // It's the first launch
      await prefs.setBool('isFirstLaunch', false); // Set the flag for future launches
      setState(() {
        isFirstLaunch = true; // Update the state
      });
    } else {
      // Not the first launch
      setState(() {
        isFirstLaunch = false; // Update the state
      });
    }
  }

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
          // splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
          curve: Easing.legacyAccelerate,
          nextScreen: const OnBoardingView(),
          // nextScreen: isFirstLaunch == null
          //     ? const OnBoardingView()
          //     : const LoginScreen(),
          animationDuration: const Duration(seconds: 1),

        ),
      ),
    );
  }
}
