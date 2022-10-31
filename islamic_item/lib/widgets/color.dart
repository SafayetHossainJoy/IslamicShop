import 'package:flutter/material.dart';

abstract class AppColor {
  static const LinearGradient gradient = LinearGradient(
    colors: [
      Colors.white,
      Color(0xFFCBAAFF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color primary = Color(0xFF935DE6);
  static const Color secondary = Color(0xFF0C0A19);
  static const Color text = Color(0xFF32303d);
  static const Color accent = Color(0xFFFFFFFF);
  static const Color accent_1 = Color(0xFFefeff6);
  static const Color accent_2 = Color(0xFFeef6ff);
  static const Color accent_3 = Color(0xFFfff7f4);
  static const Color accent_4 = Color(0xFFffe4ea);
}

abstract class AppStyle {
  static const h1Light = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      // height: 38,
      // letterSpacing: 20,
      color: AppColor.accent_1);

  static const h1Dark = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      // height: 38,
      // letterSpacing: 20,
      color: AppColor.text);

  static const h2 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      // letterSpacing: 20,
      // height: 32,
      color: AppColor.text);

  static const h3 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      // letterSpacing: 20,
      // height: 20,
      color: AppColor.text);

  static const text = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      // letterSpacing: 20,
      // height: 20,
      color: AppColor.text);

  static const bodyText = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      // letterSpacing: 20,
      // height: 20,
      color: AppColor.text);
}
