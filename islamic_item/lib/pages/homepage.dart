import 'package:flutter/material.dart';
import 'package:islamic_item/product_widget/slider.dart';
import 'package:islamic_item/screen/Popular.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //for slider
  final _imagePaths = [
    'images/mudi_islamic_item.jpg',
    'images/soaking_shoes_islamic_item.jpg',
    'images/soaking_shoes_islamic_item2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 900,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 70,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Search"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search_rounded,
                        size: 26,
                        color: Color(0xFF4C53A5),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Custom_CarouselSlider(imagePaths: _imagePaths),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      children: const [
                        Text("Popular Products",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 15, 1, 1),
                            )),
                        Spacer(),
                        Text("View All",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 15, 1, 1),
                            )),
                      ],
                    ),
                  ),
                  const PopularItem(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      children: const [
                        Text("New Arrivals",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 15, 1, 1),
                            )),
                        Spacer(),
                        Text("View All",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(221, 15, 1, 1),
                            )),
                      ],
                    ),
                  ),
                  const PopularItem(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
