import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();

  String infoResultado = "Qual será o número?";

  void _sortearNumero() {
    setState(() {
      int n1 = int.parse(n1Controller.text);
      int resultado = new Random().nextInt(10);

      infoResultado = 'O nº sorteado foi: $resultado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Jogo do Nº aleatório"),
      centerTitle: true,
      backgroundColor: Color(0XFFE58199),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Pense em um nº (de 0 a 10)", n1Controller),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo,
          labelStyle: TextStyle(color: Color(0XFFDB6481))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Color(0XFFDB6481), fontSize: 25.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _sortearNumero,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color(0XFFFD6489),
        ),
      ),
    );
  }

  _foto() {
    return Image.asset(
      "assets/images/img1.png",
      height: 300,
      width: 300,
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Color(0XFFDB6481), fontSize: 25.0),
    );
  }
}
