import 'dart:ffi';
import 'package:app_20/pages/home.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://sujeitoprogramador.com/r-api/?api=filmes';

class Api {
  listFilms() async {
    String url = '$baseURL';

    http.Response response = await http.get(Uri.parse(url));
    List retorno = json.decode(response.body);

    List<Film> lista = [];

    for (var film in retorno) {
      lista.add(Film(film["id"], film["nome"], film["sinopse"], film["foto"]));
    }

    return lista;
  }
}
