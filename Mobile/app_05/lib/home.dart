import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _infoResultado = "Informe os números!";

  void _classificar() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / (altura * altura);
      _infoResultado = "IMC = ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6)
        _infoResultado += "Abaixo do peso";
      else if (imc < 25.0)
        _infoResultado += "Peso ideal";
      else if (imc < 30.0)
        _infoResultado += "Levemente acima do peso";
      else if (imc < 35.0)
        _infoResultado += "Obesidade Grau I";
      else if (imc < 40.0)
        _infoResultado += "Obesidade Grau II";
      else
        _infoResultado += "Obesidade Grau III ou Mórbida";
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
      title: Text("Calculadora IMC"),
      centerTitle: true,
      backgroundColor: Color(0xff1E8465),
    );
  }

  _corpo() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Digite o seu peso", pesoController),
          _campo("Digite a sua altura ", alturaController),
          _botao(),
          _texto(_infoResultado),
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
          labelStyle: TextStyle(color: Color(0xff1E8465))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Color(0xff1E8465), fontSize: 18.0),
      controller: objController,
    );
  }

  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _classificar,
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.blue[400],
        ),
      ),
    );
  }

  _texto(textoParaExibir) {
    return Text(
      textoParaExibir,
      textAlign: TextAlign.center,
      style: TextStyle(color: Color(0xff1E8465), fontSize: 18.0),
    );
  }
}
