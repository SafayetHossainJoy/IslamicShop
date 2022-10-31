// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:islamic_item/pages/homepage.dart';
import 'package:islamic_item/widgets/custom_TextField.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  get product => null;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final TextEditingController _notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (Colors.teal),
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
          "Review and Feedback",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
                radius: 130,
                backgroundImage: AssetImage("images/logo-modified.png")),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reviews",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating: 0,
                          direction: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return const Icon(Icons.star, color: Colors.amber);
                          },
                          onRatingUpdate: (rating) {}),
                      //  const SizedBox(width: 30),
                      const Text(
                        "(100 Reviews)",
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "Feedback",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontWeight: FontWeight.bold),
                  ),
                  CustomTextField(
                    controller: _notesController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: 64,
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [
                              Colors.teal,
                              Color.fromARGB(255, 214, 245, 202)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          const snackBar =
                              SnackBar(content: Text("send Successful"));
                          //Scaffold.of(context).showSnackBar(snackBar);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          "Send",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
