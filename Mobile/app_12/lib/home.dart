import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app_meu_perfil_drawer_nav/pages/Formacao.dart';
import 'package:app_meu_perfil_drawer_nav/pages/Experiencia.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  final telas = [
    Center(
        child: Lottie.network(
            'https://assets10.lottiefiles.com/private_files/lf30_iwha7oma.json')),
    Formacao(),
    Experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.blue[50],
        body: telas[_currentPage],
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Karen Máximo'),
              accountEmail: Text('karen.cmaximo@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/img1.jpg'),
              ),
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Pessoal'),
              subtitle: Text('Tela Pessoal do App'),
              trailing:
                  Icon(Icons.perm_identity_rounded, color: Color(0XFF1D6192)),
              onTap: () {
                setState(() {
                  _currentPage = 0;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Formação'),
              subtitle: Text('Tela Formação do App'),
              trailing: Icon(Icons.school_sharp, color: Color(0XFF1D6192)),
              onTap: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            ListTile(
              //leading: Icon(Icons.star),
              title: Text('Experiência'),
              subtitle: Text('Tela Experiência do App'),
              trailing: Icon(Icons.badge, color: Color(0XFF1D6192)),
              onTap: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
          ],
        )),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App Meu Perfil"),
      centerTitle: true,
      backgroundColor: Color(0XFF1D6192),
    );
  }
}
