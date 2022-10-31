import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:islamic_item/pages/bottom_navigation.dart';

// ignore: camel_case_types
class Empty_cart extends StatelessWidget {
  const Empty_cart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset("images/empty_cart.png"),
        const Text(
          "Your Cart is empty",
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          "seems like you haven't added\n     anything to your cart yet!",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xffabb8d6),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        NeumorphicButton(
          child: const Text("Start Shopping",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Bottom_Navigation()));
          },
        )
      ],
    ));
  }
}
