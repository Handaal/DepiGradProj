import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future signIn() async {}
  void openSignupScreen() {
    Navigator.pushNamed(context, "/signup");
  }
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
                //Title
                Text(
                  'SIGN IN',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                //Subitile
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.robotoCondensed(fontSize: 18),
                ),
                const SizedBox(
                  height: 50,
                ),
                //Email Textfield
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
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Password TextField
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                //Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.amber[900],
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text('SIGN IN',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ))),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Text: sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NOT A MEMBER?',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: openSignupScreen,
                      child: Text(' SIGN UP NOW',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          )),
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