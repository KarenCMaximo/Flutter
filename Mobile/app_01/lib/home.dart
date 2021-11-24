import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Hello!"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFFCBDB),
        child: Center(
          child: Text(
            "Hello Karen!",
            style: TextStyle(
              fontSize: 35,
              color: Color(0xFFC75B7A),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
