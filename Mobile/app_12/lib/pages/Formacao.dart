import 'package:flutter/material.dart';

class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        body: _corpo(),
      ),
    );
  }

  _corpo() {
    return Container(
      child: SizedBox.expand(
        child: _foto(),
      ),
    );
  }

  _foto() {
    return Image.asset(
      "assets/images/img2.png",
      height: 300,
      width: 300,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      fit: BoxFit.cover,
    );
  }
}
