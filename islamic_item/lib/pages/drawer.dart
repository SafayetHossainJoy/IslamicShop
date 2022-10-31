import 'package:flutter/material.dart';
import 'package:islamic_item/Menus/AboutUs.dart';
import 'package:islamic_item/Menus/ContactUs.dart';
import 'package:islamic_item/Menus/ReviewAndFeedback.dart';
import 'package:islamic_item/Menus/TermAndCondition.dart';

// ignore: camel_case_types
class drawer extends StatelessWidget {
  const drawer({
    Key? key,
    required this.divider,
  }) : super(key: key);

  final Divider divider;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              //Title of header
              child: Image(image: AssetImage("images/logo-modified.png"))),
          //Child tile of drawer with specified title
          ListTile(
            title: const Text('About Us'),
            //To perform action on tapping at tile
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const About_Us()));
            },
          ),
          divider,
          ListTile(
            iconColor: Colors.teal,
            title: const Text('Contact Us'),
            //To perform action on tapping at tile
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Contact_Us()));
            },
          ),
          divider,
          ListTile(
            title: const Text('Terms and Conditions'),
            //To perform action on tapping at tile
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TermsAndConditions()));
            },
          ),
          /*divider,
           ListTile(
            title: const Text(' Policy'),
            //To perform action on tapping at tile
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => About_Us()));
            },
          ),*/
          divider,
          ListTile(
            title: const Text('Review and Feedback'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Review()));
            },
          ),
          divider,
          ListTile(
            title: const Text('Share'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          divider,
          ListTile(
            title: const Text('Exit'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
