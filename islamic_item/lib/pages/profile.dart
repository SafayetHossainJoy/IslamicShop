import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_item/pages/bottom_navigation.dart';
import 'package:islamic_item/pages/homepage.dart';
import 'package:islamic_item/widgets/band_color.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObsecure = true;

  // ignore: prefer_typing_uninitialized_variables
  var _image;
  final ImagePicker _picker = ImagePicker();
  chooseImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Choose Image from"),
            children: [
              SimpleDialogOption(
                child: const Text("Choose from Gallery"),
                onPressed: () {
                  chooseImageFromGallery();
                },
              ),
              SimpleDialogOption(
                child: const Text("Choose from Camera"),
                onPressed: () {
                  chooseImageFromCamera();
                },
              ),
              SimpleDialogOption(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  chooseImageFromGallery() async {
    var pickImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickImage!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  chooseImageFromCamera() async {
    var pickImage = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickImage!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Colors.teal,
                    gradient: LinearGradient(
                      colors: [
                        (Colors.teal),
                        Color.fromARGB(255, 214, 245, 202)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Bottom_Navigation(),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            alignment: Alignment.bottomLeft,
                            child: const Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                        Center(
                            child: Text(
                          "Complete Your Profile",
                          style: myStyle(20, aTextColor),
                        )),
                        InkWell(
                          onTap: () {
                            chooseImage();
                          },
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey)),
                                  child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: _image != null
                                          ? CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage:
                                                  NetworkImage(_image.path),
                                            )
                                          : IconButton(
                                              icon: const Icon(Icons.camera),
                                              onPressed: () {
                                                chooseImage();
                                              },
                                            )),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                right: 120,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel_sharp,
                                      size: 30,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        const Color.fromARGB(255, 105, 222, 235)
                            .withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 105, 222, 235), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 105, 222, 235),
                        width: 1,
                      ),
                    ),

                    labelText: "Enter Your Name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        const Color.fromARGB(255, 105, 222, 235)
                            .withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 105, 222, 235), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 105, 222, 235),
                        width: 1,
                      ),
                    ),
                    labelText: "Enter Phone Number",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your Phone Number",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Invalid Email";
                    } else if (!value.contains("com")) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        const Color.fromARGB(255, 105, 222, 235)
                            .withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 105, 222, 235), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 105, 222, 235),
                        width: 1,
                      ),
                    ),
                    labelText: "Enter your Email ",
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black54,
                    ),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your Email",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObsecure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password Required";
                    }

                    if (value.length > 15) {
                      return "Password is too long";
                    }

                    if (value.length < 3) {
                      return "Password is too short";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // hoverColor: Colors.black,
                    filled: true,
                    errorStyle: myStyle(
                        12,
                        const Color.fromARGB(255, 105, 222, 235)
                            .withOpacity(0.9),
                        FontWeight.w500),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 105, 222, 235), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 105, 222, 235),
                        width: 1,
                      ),
                    ),
                    labelText: "Enter your Password ",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      icon: Icon(_isObsecure == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Colors.black54,
                    ),
                    //prefixIcon: Icon(Icons.lock),
                    labelStyle: myStyle(12, Colors.black54),
                    hintText: "Enter your Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 54,
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
                            SnackBar(content: Text("Save Successfully"));
                        //Scaffold.of(context).showSnackBar(snackBar);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
