import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();

  String infoResultado = "Informe os números!";

  void _verificarCombustivel() {
    setState(() {
      double gasolina = double.parse(gasolinaController.text);
      double alcool = double.parse(alcoolController.text);
      double resultado = (alcool / gasolina);
      if (resultado > 0.70) {
        infoResultado = 'Resultado: ${resultado.toStringAsPrecision(3)}'
            '\n\nVale a pena abastecer com Gasolina!';
      } else {
        infoResultado = 'Resultado: ${resultado.toStringAsPrecision(3)}'
            '\n\nVale a pena abastecer com Álcool!';
      }
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
      title: Text("Álcool ou Gasolina"),
      centerTitle: true,
      backgroundColor: Colors.orange[700],
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(12.0, 0, 12.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Digite o preço da gasolina", gasolinaController),
          _campo("Digite o preço do álcool", alcoolController),
          _botao(),
          _texto(infoResultado),
        ],
      ),
    );
  }

  _foto() {
    return Image.asset(
      "assets/images/img1.png",
      height: 250,
      width: 250,
    );
  }

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo,
          labelStyle: TextStyle(color: Colors.orange[700])),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.orange[700], fontSize: 16.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _verificarCombustivel,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 22.0)),
          color: Colors.blue[400],
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green[600], fontSize: 20.0),
    );
  }
}
