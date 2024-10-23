// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String firstname;
  final String lastname;
  final String email;
  final int phone;
  final String address;

  User({

    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.address,
  });

  // Factory method to create a User from JSON data
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}

class Profile extends StatefulWidget {
  final String token;

  const Profile({super.key, required this.token});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  // Fetch user profile from API and map to User class
  Future<void> _fetchUserProfile() async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/user/userInfo');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': widget.token,
        },
      );

      final decodedBody = json.decode(response.body);
      if (decodedBody['statusCode'] == 200) {
        print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        print(decodedBody['data']);
        print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
        setState(() {
          user = User.fromJson(decodedBody['data']);
          isLoading = false;
        });
      } else {
        _handleError("Failed to load profile: ${response.statusCode}");
      }
    } catch (e) {
      _handleError("An error occurred: $e");
    }
  }

  // Helper method to handle errors
  void _handleError(String message) {
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "User Profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: kPrimaryColor, // Adjust to your theme
          centerTitle: true,
          elevation: 2,
          automaticallyImplyLeading: false,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : user == null
                ? Center(child: Text('No user data found'))
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        _buildProfileCard('Name', '${user!.firstname} ${user!.lastname}'),
                        _buildProfileCard('Email', user!.email),
                        _buildProfileCard('Phone', "+20${user!.phone}"),
                        _buildProfileCard('Address', user!.address),
                      ],
                    ),
                  ),
      ),
    );
  }

  // Helper method to build individual profile cards
  Widget _buildProfileCard(String label, String value) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
