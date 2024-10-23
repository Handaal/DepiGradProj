import 'package:flutter/material.dart';
import 'components/body.dart';



class HomeScreen extends StatelessWidget{
  static String routeName="/home_screen";
  final String token;

  const HomeScreen({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Body(token: token),
   );
  }
}