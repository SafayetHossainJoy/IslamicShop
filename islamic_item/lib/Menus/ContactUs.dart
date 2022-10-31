// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:islamic_item/pages/homepage.dart';

// ignore: camel_case_types
class Contact_Us extends StatefulWidget {
  const Contact_Us({Key? key}) : super(key: key);

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

// ignore: camel_case_types
class _Contact_UsState extends State<Contact_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Xsellence Bangladesh Limited',
        textColor: Colors.white,
        backgroundColor: Colors.teal.shade300,
        email: 'info@islamicitem.com',
        // textFont: 'Sail',
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        leading: InkWell(
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ));
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          "Contact Us",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ContactUs(
        cardColor: Colors.white,
        textColor: Colors.teal,
        logo: const AssetImage("images/logo-modified.png"),
        email: 'info@islamicitem.com',
        companyName: 'Islamic Item',
        companyColor: Colors.teal,
        dividerThickness: 2,
        website: "https://www.islamicitem.com/",
        phoneNumber: '01880088459',
        tagLine: 'Great products for great people',
        taglineColor: Colors.teal,
        facebookHandle:
            "https://www.facebook.com/Islamic-Items-105725824647305",
      ),
    );
  }
}
