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
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _selectedIndex = 2;

  void _navigateBottomBar (int index){
    setState(() {
      _selectedIndex = index;
    }); 
  }

  final List<Widget> _pages = [    
    Profile(),
    Settings(),
    HomeScreen(),
    Products(), 
    Cart(),
  ];

  final GlobalKey<CurvedNavigationBarState>_curvednavigationkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final token = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      
      
      // backgroundColor: Colors.transparent,

      extendBody: true,
    
      bottomNavigationBar: CurvedNavigationBar(
      
        key: _curvednavigationkey,
        
        buttonBackgroundColor: kPrimaryColor,
        backgroundColor: Colors.transparent,
        
        color: const Color.fromARGB(206, 0, 0, 0),
        
        
        animationCurve: Curves.easeInOut,
      
        animationDuration: const Duration(milliseconds: 300),   
        height: 70,
        onTap:(index) {
          _navigateBottomBar(index);
      
          // final CurvedNavigationBarState? navBarState = _curvednavigationkey.currentState;
          // navBarState?.setPage(index);
      
          // if (index == 0){
          //   Navigator.pushNamed(context, "/profile",arguments: token);
            
          // }
          // else if (index == 1){
          //   Navigator.pushNamed(context, "/products",arguments: token);
          // }
          // else if (index == 2){
          //   Navigator.pushNamed(context, "/home",arguments: token);
          // }
          // else if (index == 3){
          //   Navigator.pushNamed(context, "/brands",arguments: token);
          // }
          // else if (index == 4){
          //   Navigator.pushNamed(context, "/cart",arguments: token);
          // }
        },
        
      
        letIndexChange: (index) => true,
        
        index: _selectedIndex,
        
        
        items: const [
          
          Icon(
            Icons.person,
            color: Colors.white, 

          ),
        
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        
          Icon(
            Icons.home,
            color: Colors.white,
          ),

          Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
        
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        
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

