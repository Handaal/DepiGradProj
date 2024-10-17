import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';


class specialsIdentifier extends StatelessWidget {
  const specialsIdentifier({
    super.key,
    required this.text,
    required this.press
  });
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: const Color.fromARGB(225, 0, 0, 0)
            ),
          ),
          GestureDetector(
              onTap: press,
              child:const Text("See More"))
        ],
      ),
    );
  }
}