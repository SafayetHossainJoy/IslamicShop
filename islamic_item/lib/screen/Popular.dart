import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_item/api/user%20model/pro.dart';
import 'package:islamic_item/screen/ProductDetailScreen.dart';

class PopularItem extends StatefulWidget {
  const PopularItem({super.key});

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  Productget? data;
  bool isloading = false;
  @override
  void initState() {
    readLocalJson();
    super.initState();
  }

  Map<String, dynamic> myMap = Map();
  readLocalJson() async {
    isloading = true;
    print("START");
    var f = await rootBundle.loadString("assets/emprecord.json");
    // print("r$f");
    var data = jsonDecode(f);
    print("j");
    // Productget data1 = Productget.fromJson(data);\
    myMap = data;
    print("e");
    setState(() {
      isloading = false;
    });
    print("All Data are $data");
  }

  ScrollController controller = ScrollController();
  void up() {
    final double start = 0;
    controller.animateTo(start,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn);
  }

  void down() {
    final double back = controller.position.maxScrollExtent;
    controller.animateTo(back,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.30,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              controller: controller,
              itemCount: myMap["result"]["response"].length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: new Column(
                    children: [
                      Container(
                        width: 300,
                        child: new Card(
                          elevation: 1,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => App()));
                                    },
                                    child: new Container(
                                      height: 124,
                                      width: 400,
                                      child: new Image.network(
                                          '${myMap["result"]["response"][index]["image_128"]}'),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: new Container(
                                        height: 40,
                                        width: 40,
                                        decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: new Icon(Icons.favorite_border),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                    "${myMap["result"]["response"][index]["name"]}"),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
