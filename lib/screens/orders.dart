// ignore_for_file: use_super_parameters

import 'dart:convert';
import 'package:ecommercehome/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderHistoryPage extends StatefulWidget {
  final String token; 

  const OrderHistoryPage({Key? key, required this.token}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<dynamic> _orders = [];
  bool _isLoading = true;
  bool _hasError = false;

  // Fetch orders from the API
  Future<void> fetchOrders() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/user/orderHistory'),
        headers: {
          'Authorization': widget.token,
          'Content-Type': 'application/json',
        },
      );

      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          _orders = jsonResponse['data'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'Orders History',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,         
              ),
            ),
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _hasError
                ? const Center(child: Text('Failed to load orders.'))
                : ListView.builder(
                    itemCount: _orders.length,
                    itemBuilder: (context, index) {
                      final order = _orders[index];
                      final date = DateTime.parse(order['date']);
                      final formattedDate =
                          '${date.day}-${date.month}-${date.year} ${date.hour}:${date.minute}';
      
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              width: 2,
                              // color: kPrimaryColor
                            ),
                          
                          ),
                          leading: CircleAvatar(
                            backgroundColor: secondaryColor,
                            child: Text(
                              '${index+1}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(
                            'Total: \$${order['total']}',
                            style:TextStyle(
                              color: secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Date: $formattedDate',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 9, 154, 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
