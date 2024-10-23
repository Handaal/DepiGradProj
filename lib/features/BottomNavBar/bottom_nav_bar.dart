// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommercehome/screens/cart.dart';
import 'package:ecommercehome/screens/home_screen/home.dart';
import 'package:ecommercehome/screens/products.dart';
import 'package:ecommercehome/screens/profile.dart';
import 'package:ecommercehome/screens/settings.dart';
import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  final String token;

  const BottomNavBar({super.key, required this.token});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;

  // Initialize the pages with the token passed from BottomNavBar
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      Profile(token: widget.token),
      Settings(token: widget.token),
      HomeScreen(token: widget.token),
      Products(token: widget.token),
      Cart(token: widget.token),
    ];
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<CurvedNavigationBarState> _curvednavigationkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print("Token received: ${widget.token}");
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _curvednavigationkey,
        buttonBackgroundColor: kPrimaryColor,
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(206, 0, 0, 0),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        height: 70,
        onTap: (index) {
          _navigateBottomBar(index);
        },
        letIndexChange: (index) => true,
        index: _selectedIndex,
        items: const [
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
