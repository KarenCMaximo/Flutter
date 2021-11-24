import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController githubController = TextEditingController();
  String info_github = '';

  _recuperarGithub() async {
    String url = 'https://api.github.com/users/${githubController.text}';

    print(url);

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    int id = retorno["id"];
    String login = retorno["login"];
    int public_repos = retorno["public_repos"];
    int followers = retorno["followers"];
    int following = retorno["following"];
    String created_at = retorno["created_at"];

    setState(() {
      info_github =
          '\n id: $id \n login: $login \n public_repos: $public_repos \n followers: $followers \n following: $following \n created_at: $created_at';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Perfil dos DEVs"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(22),
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  image: NetworkImage(
                      'https://avatars.githubusercontent.com/u/80219539?v=4'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Digite o login do GitHub",
                  labelStyle: TextStyle(color: Colors.black45)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 20.0),
              controller: githubController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _recuperarGithub,
                  child: Text("Obter github",
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  color: Colors.black45,
                ),
              ),
            ),
            Text(info_github),
          ],
        ),
      ),
    );
  }
}
