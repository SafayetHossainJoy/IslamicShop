import 'dart:io';

import 'package:flutter/material.dart';
import 'package:islamic_item/pages/cart.dart';
import 'package:islamic_item/pages/drawer.dart';
import 'package:islamic_item/pages/homepage.dart';
import 'package:islamic_item/pages/massage.dart';
import 'package:islamic_item/pages/profile.dart';
import 'package:islamic_item/pages/wishlist.dart';
import 'package:islamic_item/screen/login.dart';
import 'package:islamic_item/screen/signup.dart';
import 'package:islamic_item/widgets/band_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

// ignore: camel_case_types
class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int currentIndex = 0;
  final divider = const Divider(
    color: Colors.black,
  );

  List<Widget> pages = [
    const Homepage(),
    const wishlist(),
    const cart(),
    const Massage(),
    const Profile()
  ];

  onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            title: Text(
              "Are You Sure ?",
              style: myStyle(16, Colors.white, FontWeight.w500),
            ),
            content: const Text("You are going to exit the app !"),
            titlePadding:
                const EdgeInsets.only(top: 30, bottom: 12, right: 30, left: 30),
            contentPadding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            backgroundColor: BrandColors.colorPrimaryDark,
            contentTextStyle: myStyle(
                14, BrandColors.colorText.withOpacity(0.7), FontWeight.w400),
            titleTextStyle: myStyle(18, Colors.white, FontWeight.w500),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            actions: <Widget>[
              MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: myStyle(14, BrandColors.colorText),
                  )),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: BrandColors.colorPurple,
                child: Text(
                  'Yes',
                  style: myStyle(14, Colors.white, FontWeight.w500),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }

  SharedPreferences? sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu, color: Colors.black))),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        centerTitle: true,
        title: const Text(
          "Islamic Item",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      dividerColor: Colors.black,
                      iconTheme: const IconThemeData(color: Colors.black)),
                  child: PopupMenuButton<Menu>(
                      onSelected: (value) {
                        if (value == Menu.itemlogin) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                        } else if (value == Menu.itemsignup) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegistationPage(),
                          ));
                        } else if (value == Menu.itemlogout) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Homepage(),
                          ));
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Menu>>[
                            PopupMenuItem<Menu>(
                              value: Menu.itemlogin,
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.login,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Log In")
                                ],
                              ),
                            ),
                            PopupMenuItem<Menu>(
                              value: Menu.itemsignup,
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.app_registration,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Sign Up")
                                ],
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<Menu>(
                              value: Menu.itemlogout,
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text("Sign Out")
                                ],
                              ),
                            ),
                          ]),
                )),
          )
        ],
      ),
      drawer: drawer(divider: divider),
      body: WillPopScope(
        onWillPop: () async {
          return onBackPressed();
        },
        child: Container(child: pages[currentIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 1, 23, 41),
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.textsms_outlined),
            label: "Massage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

enum Menu { itemlogin, itemsignup, itemlogout }
