import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Contador Pessoas"),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.pink[50],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Container(
            child: Lottie.network(
                'https://assets7.lottiefiles.com/private_files/lf30_fpxjxaot.json'),
            width: 200,
            height: 200,
          )),
          const Text('Contador de Pessoas',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 30,
              )),
          Text('$_counter',
              style: TextStyle(
                color: Colors.pink[400],
                fontSize: 40,
              )),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            backgroundColor: Colors.pink[400],
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
            backgroundColor: Colors.pink[200],
          ),
        ],
      ),
    );
  }
}
