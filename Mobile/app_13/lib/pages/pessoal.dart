import 'package:flutter/material.dart';
import 'package:meu_perfil1/pages/formacao.dart';
import 'package:meu_perfil1/pages/experiencia.dart';
import 'package:lottie/lottie.dart';

class Pessoal extends StatefulWidget {
  const Pessoal({Key? key}) : super(key: key);

  @override
  _PessoalState createState() => _PessoalState();
}

class _PessoalState extends State<Pessoal> {
  int _currentIndex = 0;

  final tabs = [
    Center(
        child: Lottie.network(
            'https://assets10.lottiefiles.com/packages/lf20_rdspxrfm.json')),
    Formacao(),
    Experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFd0ab9f),
          //iconSize: 20,
          //selectedFontSize: 20,
          //unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Pessoal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Formação',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.badge_sharp),
              label: 'Experiência',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App Meu Perfil"),
      centerTitle: true,
      backgroundColor: Color(0xFFB67E68),
    );
  }

  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _botao(context, 'Ir para Tela Formação', Formacao()),
            _botao(context, 'Ir para Tela Experiência', Experiencia()),
            _texto(),
          ],
        ),
      ),
    );
  }

  _texto() {
    return Text(
      'Tela Pessoal',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  _botao(BuildContext context, String textoBotao, Widget tela) {
    return RaisedButton(
        color: Colors.green,
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickNavegacao(context, tela);
        });
  }

  _onClickNavegacao(BuildContext context, Widget tela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return tela;
      }),
    );
  }
}
