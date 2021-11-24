import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String info_endereco = '11330000';

  _recuperarCep() async {
    String url = 'https://viacep.com.br/ws/${info_endereco}/json/';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      info_endereco =
          'Logradouro: $logradouro \nBairro: $bairro \nCidade: $localidade \nEstado: $uf';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta de CEP"),
        backgroundColor: Colors.lime[800],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Meu CEP",
                  labelStyle: TextStyle(color: Colors.lime[800])),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lime[800], fontSize: 25.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarCep,
                  child: Text("Obter endereço",
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  color: Colors.lime[800],
                ),
              ),
            ),
            Text(info_endereco),
          ],
        ),
      ),
    );
  }
}
