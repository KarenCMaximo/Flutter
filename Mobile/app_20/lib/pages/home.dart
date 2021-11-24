// ignore_for_file: prefer_const_constructors

import 'package:app_20/pages/details.dart';
import 'package:app_20/services/api.dart';
import 'package:app_20/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Film> films = [];

  getAllFilms() async {
    var api = Api();
    List<Film> newfilms = await api.listFilms();

    setState(() {
      films = newfilms;
    });
  }

  @override
  void initState() {
    getAllFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de Filmes"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: films.length,
      itemBuilder: (BuildContext context, int index) {
        Film film = films[index];

        return ListTile(
          title: Text(film.nome),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(film.foto),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        film: film,
                      )),
            ).then((value) => getAllFilms());
          },
        );
      },
    );
  }
}

class Film {
  final int id;
  final String nome;
  final String sinopse;
  final String foto;

  Film(this.id, this.nome, this.sinopse, this.foto);
}
