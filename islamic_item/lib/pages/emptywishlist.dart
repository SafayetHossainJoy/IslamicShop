import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';

// ignore: camel_case_types
class Empty_Wishlist extends StatefulWidget {
  const Empty_Wishlist({super.key});

  @override
  State<Empty_Wishlist> createState() => _Empty_WishlistState();
}

// ignore: camel_case_types
class _Empty_WishlistState extends State<Empty_Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: EmptyWidget(
        image: "images/man.png",
      ),
    ));
  }
}
