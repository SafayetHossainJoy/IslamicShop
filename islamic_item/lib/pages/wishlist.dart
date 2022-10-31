import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:islamic_item/product_widget/empty_wishlist.dart';

// ignore: camel_case_types
class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

// ignore: camel_case_types
class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_constructors
          children: const [Empty_wishlist()],
        ),
      ),
    );
  }
}
