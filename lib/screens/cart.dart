// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:ecommercehome/features/register/toast.dart';
import 'package:ecommercehome/utils/constants.dart';
import 'package:ecommercehome/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartItem {
  final int id;
  final String name;
  final int price;
  int quantity;
  final String image;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'] ?? 1,
      image: json['image'] ?? '',
    );
  }
}

class Cart extends StatefulWidget {
  final String token;

  const Cart({super.key, required this.token});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartItem> cartItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    final Uri url = Uri.parse('http://10.0.2.2:3000/cart/');
    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': widget.token,
      });

      final decodedBody = json.decode(response.body);
      print("Decoded Body: $decodedBody");

      if (response.statusCode == 200 && decodedBody['statusCode'] == 200) {
        final List<dynamic> data = decodedBody['data'][0];
        print(data);
        setState(() {
          cartItems = data.map((item) => CartItem.fromJson(item)).toList();
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        _showErrorToast("Failed to load cart items: ${decodedBody['message']}");
      }
    } catch (e) {
      setState(() => isLoading = false);
      _showErrorToast("An error occurred: $e");
    }
  }

  Future<void> _RemoveFromCart(BuildContext context,int productId) async {
    final Uri urll = Uri.parse('http://10.0.2.2:3000/cart/dec/$productId');
    
    final response = await http.post(
      urll,
      headers: {'Content-Type': 'application/json; charset=UTF-8'
      ,'Authorization': widget.token,
      },
    );

    final decodedBody = json.decode(response.body);
    if (decodedBody['statusCode'] == 200) {
      // showToast(message: "Product removed from cart");
    } else {
      showToast(message: "Error Removing product");
    }
  }

  Future<void> _addToCart(BuildContext context,int productId) async {
    final Uri urll = Uri.parse('http://10.0.2.2:3000/cart/add/$productId');
    
    final response = await http.post(
      urll,
      headers: {'Content-Type': 'application/json; charset=UTF-8'
      ,'Authorization': widget.token,
      },
    );

    final decodedBody = json.decode(response.body);
    if (decodedBody['statusCode'] == 200) {
      // showToast(message: "Product Added to cart");
    } else {
      showToast(message: "Error loading products");
    }
  }

  Future<void> _CheckOut() async {
    final Uri urll = Uri.parse('http://10.0.2.2:3000/order/place');
    
    final response = await http.post(
      urll,
      headers: {'Content-Type': 'application/json; charset=UTF-8'
      ,'Authorization': widget.token,
      },
    );

    final decodedBody = json.decode(response.body);
    if (decodedBody['statusCode'] == 200) {
      // showToast(message: "Product Added to cart");
    } else {
      showToast(message: "Error Checking Out");
    }
  }


  void _showErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void incrementQuantity(int index,int productId) {
    setState(() {
      cartItems[index].quantity++;
      _addToCart(context,productId);
    });
  }

  void decrementQuantity(int index, int itemId) {
    setState(() {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
        showToast(message: "Product removed from cart");
      }
      _RemoveFromCart(context,itemId);
    });
  }

  Widget _buildCartItem(CartItem item, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: item.image.isNotEmpty
            ? Image.network(
                item.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : const SizedBox(width: 50, height: 50),
        title: Text(item.name, style: const TextStyle(fontSize: 16)),
        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () => decrementQuantity(index,item.id),
            ),
            Text('${item.quantity}', style: const TextStyle(fontSize: 18)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () => incrementQuantity(index,item.id),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : cartItems.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            return _buildCartItem(cartItems[index], index);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(15),
                            ),
                            Text(
                              '\$${_calculateTotalPrice().toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildCheckoutButton(), 
                    ],
                  ),
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 30, right: 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: secondaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          onPressed: () => {
            _showThankYouDialog(),
            _CheckOut(),
            _fetchCartItems(),
          },
          child: const Text(
            'Checkout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.check_circle, size: 60, color: Colors.green),
              SizedBox(height: 16),
              Text(
                'Thank You for Your Purchase!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Your order has been placed successfully.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ),
          ],
        );
      },
    );
  }

  double _calculateTotalPrice() {
    return cartItems.fold(
      0.0,
      (total, item) => total + (item.price * item.quantity),
    );
  }
}
