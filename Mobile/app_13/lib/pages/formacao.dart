import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
        child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_wncqbx3a.json'));
  }
}
