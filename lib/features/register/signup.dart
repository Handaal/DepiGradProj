import 'dart:convert';

import 'package:ecommercehome/features/register/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // final bool _obscureText1 = true;
  // final bool _obscureText2 = true;


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController addressController = TextEditingController();


  Future<void> _register(BuildContext context) async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/auth/signup');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{ 
          'Content-Type': 'application/json; charset=UTF-8', 
        }, 
        body: jsonEncode(<String, dynamic>{
          /////////////// controllers mesh metratebeen ratebhom lama handal yzawedlohom fieelds
          'firstname': firstNameController.text,
          'lastname': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'cPassword': cPasswordController.text,
          'phone': phoneController.text,
          "address": "this is a test address",
        }),
      );

      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final int? statusCode = decodedBody['statusCode'];
      final String? message = decodedBody['message'];
      final List<dynamic>? errorMessages = decodedBody['data'] != null
          ? List<String>.from(decodedBody['data'])
          : null;

      if (statusCode == 200) {
          showToast(message: "$message");
          Navigator.pushNamed(context, "/login");
      } else {
        if (errorMessages == null) {
          showToast(message: "$message");
        } else {
          final combinedErrors = errorMessages.join(', ');
          showToast(message: combinedErrors);
        }
      }
      
    } catch (error) {
      showToast(message: "An error occured, please try again!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Title
                const Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Subtitle
                const Text(
                  'Welcome! Sign Up Now',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: phoneController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Confirm Password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: cPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                // Sign up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    // onTap: signUp,
                    onTap: ()=>_register(context),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Text: sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      // onTap: openLoginScreen,
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text(
                        ' SIGN IN NOW',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
