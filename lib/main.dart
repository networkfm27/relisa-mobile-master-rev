import 'package:flutter/material.dart';
// import 'package:relisa/page/login.dart';
import 'package:relisa/page/welcome.dart';
// import 'page/event_relawan/event_layout.dart';

void main(List<String> args) {
  runApp(const Relisa());
}

class Relisa extends StatelessWidget {
  const Relisa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
