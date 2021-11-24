import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas TI"),
      centerTitle: true,
      backgroundColor: Colors.orange[800],
    );
  }

  _corpo() {
    return Container(
      color: Colors.orange[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _carrosel(),
        ],
      ),
    );
  }

  _carrosel() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 400,
      child: ListView(
        children: <Widget>[
          Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_xgqud5s4.json'),
          _vagas("Desenvolvedor Backend", "Salário: xxxxxx",
              "Descrição: Lorem ipsum", "Contato: (xx)xxxx-xxxx"),
          _vagas("Engenheiro de Dados", "Salário: xxxxxx",
              "Descrição: Lorem ipsum", "Contato: (xx)xxxx-xxxx"),
          _vagas("Scrum Master", "Salário: xxxxxx", "Descrição: Lorem ipsum",
              "Contato: (xx)xxxx-xxxx"),
          _vagas("Product Owner", "Salário: xxxxxx", "Descrição: Lorem ipsum",
              "Contato: (xx)xxxx-xxxx"),
          _vagas("Desenvolvedor Frontend", "Salário: xxxxxx",
              "Descrição: Lorem ipsum", "Contato: (xx)xxxx-xxxx"),
          _vagas("QA Sênior", "Salário: xxxxxx", "Descrição: Lorem ipsum",
              "Contato: (xx)xxxx-xxxx"),
        ],
      ),
    );
  }

  _vagas(String vaga, String salario, String descricao, String contato) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        padding: EdgeInsets.only(top: 10, bottom: 10),
        color: Colors.orange[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _texto(vaga),
            _texto1(salario),
            _texto2(descricao),
            _texto3(contato),
          ],
        ),
      ),
    );
  }

  _texto(String vaga) {
    return Text(
      vaga,
      style: TextStyle(
          color: Colors.orange[800],
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _texto1(String salario) {
    return Text(
      salario,
      style: TextStyle(
          color: Colors.orange[600],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _texto2(String descricao) {
    return Text(
      descricao,
      style: TextStyle(
          color: Colors.orange[600],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _texto3(String contato) {
    return Text(
      contato,
      style: TextStyle(
          color: Colors.orange[600],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
