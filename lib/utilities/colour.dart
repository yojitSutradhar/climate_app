import 'package:flutter/material.dart';



class colors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff7b4397), Color(0xffdc2430)],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight),
      ),
    );
  }
}

