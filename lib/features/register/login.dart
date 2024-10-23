// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ecommercehome/features/BottomNavBar/bottom_nav_bar.dart';
import 'package:ecommercehome/features/register/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
// bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // bool _isLoading = false; // Track loading state

  

  Future<void> _login(BuildContext context) async {

    // setState(() {
    //   _isLoading = true; // Set loading state to true when reset password starts
    // });

    final Uri url = Uri.parse('http://10.0.2.2:3000/auth/login');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );



      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final int? statusCode = decodedBody['statusCode'];
      final String? message = decodedBody['message'];
      final List<dynamic>? errorMessages = decodedBody['data'] != null
          ? List<String>.from(decodedBody['data'])
          : null;

      if (statusCode == 200) {
        // final int? role = decodedBody['role'];
        String? token = decodedBody['token'];
        token = "LFinders$token";
        showToast(message: "$message");
        Navigator.push(context, MaterialPageRoute(
              builder: (context) => BottomNavBar(token: token!),
            ),
        );

        // print(role);
        
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

    // setState(() {
    //   _isLoading = false; // Set loading state to false after password reset process
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  'SIGN IN',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Subtitle
                Text(
                  'Welcome Back!',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
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
                // Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    // onTap: signIn,
                   onTap: () {
                      _login(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.amber[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'SIGN IN',
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
                      'NOT A MEMBER?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      // onTap: openSignupScreen,
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text(
                        ' SIGN UP NOW',
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
