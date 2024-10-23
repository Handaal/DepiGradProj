// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:ecommercehome/Models/product.dart';
import 'package:ecommercehome/features/BottomNavBar/bottom_nav_bar.dart';
import 'package:ecommercehome/features/register/login.dart';
import 'package:ecommercehome/features/register/signup.dart';
import 'package:ecommercehome/features/splash/splash_view.dart';
import 'package:ecommercehome/screens/orders.dart';
import 'package:ecommercehome/screens/pants.dart';
import 'package:ecommercehome/screens/cart.dart';
import 'package:ecommercehome/screens/deals.dart';
import 'package:ecommercehome/screens/tshirts.dart';
import 'package:ecommercehome/screens/hoodies.dart';
import 'package:ecommercehome/screens/home_screen/components/searchBar.dart';
import 'package:ecommercehome/screens/home_screen/components/search_result.dart';
import 'package:ecommercehome/screens/home_screen/home.dart';
import 'package:ecommercehome/screens/notifications.dart';
import 'package:ecommercehome/screens/sets.dart';
import 'package:ecommercehome/screens/productdetails.dart';
import 'package:ecommercehome/screens/products.dart';
import 'package:ecommercehome/screens/profile.dart';
import 'package:ecommercehome/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  get searchController => null;
  
  get token => null;
  
  get productId => null;

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
            '/home' : (context) =>  HomeScreen(token: token),
            '/bottomNavBar' : (context) => BottomNavBar(token: token),
            '/cart' : (context) => Cart(token: token),
            '/profile' : (context) => Profile(token: token),  
            '/settings' : (context) => Settings(token: token),
            '/products' : (context) =>  Products(token: token),
            '/notifications' : (context) => const Notifications(),
            '/tshirts' : (context) => Tshirts(token: token),
            '/hoodies' : (context) => Hoodies(token: token),
            '/pants' : (context) => Pants(token: token),
            '/deals' : (context) => Deals(),
            '/sets' : (context) => Sets(token: token),
            '/productDetails' : (context) => ProductDetailsPage(productId: productId,token: token),
            '/search' : (context) =>   Searchbar(token: token),
            '/results' : (context) =>  SearchResult(token: token),
            '/orders' : (context) =>  OrderHistoryPage(token: token),

          },
        );
      }
    );
  }
}


