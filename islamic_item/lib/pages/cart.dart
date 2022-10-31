import 'package:flutter/material.dart';
import 'package:islamic_item/product_widget/empty_cart.dart';

// ignore: camel_case_types
class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

// ignore: camel_case_types
class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_constructors
          children: const [Empty_cart()],
        ),
      ),
    );
  }
}
