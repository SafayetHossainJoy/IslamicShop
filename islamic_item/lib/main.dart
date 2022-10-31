import 'package:flutter/material.dart';
import 'package:islamic_item/widgets/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      //home: const Bottom_Navigation(),
      home: const splash_screen(),
    );
  }
}
