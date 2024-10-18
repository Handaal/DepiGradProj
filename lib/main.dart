// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:ecommercehome/Models/product.dart';
import 'package:ecommercehome/features/BottomNavBar/bottom_nav_bar.dart';
import 'package:ecommercehome/features/register/login.dart';
import 'package:ecommercehome/features/register/signup.dart';
import 'package:ecommercehome/features/splash/splash_view.dart';
import 'package:ecommercehome/screens/books.dart';
import 'package:ecommercehome/screens/cart.dart';
import 'package:ecommercehome/screens/deals.dart';
import 'package:ecommercehome/screens/electronics.dart';
import 'package:ecommercehome/screens/fashion.dart';
import 'package:ecommercehome/screens/home_screen/home.dart';
import 'package:ecommercehome/screens/notifications.dart';
import 'package:ecommercehome/screens/other.dart';
import 'package:ecommercehome/screens/productdetails.dart';
import 'package:ecommercehome/screens/products.dart';
import 'package:ecommercehome/screens/profile.dart';
import 'package:ecommercehome/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
          routes: {
            '/login' : (context) =>  LoginScreen(),
            '/signup' : (context) =>  SignupScreen(),
            '/home' : (context) =>  HomeScreen(),
            '/bottomNavBar' : (context) => const BottomNavBar(),
            '/cart' : (context) => const Cart(),
            '/profile' : (context) => const Profile(),
            '/settings' : (context) => const Settings(),
            '/products' : (context) => const Products(),
            '/notifications' : (context) => const Notifications(),
            '/electronics' : (context) => const Electronics(),
            '/fashion' : (context) => const Fashion(),
            // '/books' : (context) => const Books(),
            '/deals' : (context) => const Deals(),
            '/other' : (context) => const Other(),
            '/productDetails' : (context) => const ProductDetailsPage(),
          },
        );
      }
    );
  }
}


