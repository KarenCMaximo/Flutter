// ignore_for_file: prefer_const_constructors

import 'package:app_20/services/api.dart';
import 'package:app_20/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'home.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.film}) : super(key: key);

  final Film film;

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            "${film.nome} - Sinopse",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            film.sinopse,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
