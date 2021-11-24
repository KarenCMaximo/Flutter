import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
        child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_pqdnvhfb.json'));
  }
}
