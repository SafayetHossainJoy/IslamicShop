import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:islamic_item/pages/homepage.dart';
import 'package:islamic_item/screen/login.dart';
import 'package:islamic_item/widgets/custom_TextField.dart';
import 'package:islamic_item/widgets/widget.dart';

import '../Cores Api/custom_http_request.dart';

class RegistationPage extends StatefulWidget {
  const RegistationPage({Key? key}) : super(key: key);

  @override
  State<RegistationPage> createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
      // I am connected to a wifi network.
    }
    showInToast("No Internet");
    return false;
  }

  getRegister() async {
    check().then((internet) async {
      if (internet) {
        var map = <String, dynamic>{};
        map["name"] = nameController.text.toString();
        map["email"] = emailController.text.toString();
        map["password"] = passwordController.text.toString();
        map["password_confirmation"] =
            confirmPasswordController.text.toString();
        var responce = await http.post(
            Uri.parse(
              "https://apihomechef.antopolis.xyz/api/admin/create/new/admin",
            ),
            body: map,
            headers: CustomHttpRequest.defaultHeader);
        if (responce.statusCode == 201) {
          showInToast("Registation Successfull");
        } else {
          showInToast("Registation failed");
        }
      } else {
        showInToast("No Internet Connection");
      }
    });
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Colors.teal,
                gradient: LinearGradient(
                  colors: [(Colors.teal), Color.fromARGB(255, 214, 245, 202)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "images/logo-modified.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: nameController,
              hintText: "Enter your name",
              prefixIcon: const Icon(Icons.person),
            ),
            CustomTextField(
              controller: emailController,
              hintText: "Enter your Email",
              prefixIcon: const Icon(Icons.email),
            ),
            CustomTextField(
              controller: passwordController,
              hintText: "Enter your password",
              prefixIcon: const Icon(Icons.vpn_key),
            ),
            CustomTextField(
              controller: confirmPasswordController,
              hintText: "Enter Confirm password",
              prefixIcon: const Icon(Icons.vpn_key),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                getRegister();
                Navigator.pop(
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
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 105, 222, 235),
                    Color.fromARGB(255, 214, 245, 202)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: const Text(
                  "REGISTER",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have Already Member?  "),
                  GestureDetector(
                    child: const Text(
                      "Login Now",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
