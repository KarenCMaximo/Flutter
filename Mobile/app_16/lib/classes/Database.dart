// ignore_for_file: file_names

import 'package:app_16/pages/add_item.dart';
import 'package:app_16/pages/home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  getDatabase() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco-compras.db");

    var database = await openDatabase(localBancoDados, version: 1,
        onCreate: (db, dbVersaoRecente) {
      String sql =
          "CREATE TABLE lista_compras (id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR, qtd INT) ";
      db.execute(sql);
    });

    return database;
  }

  getLista() async {
    Database bd = await getDatabase();

    String sql = "SELECT * FROM lista_compras";
    List listCompra = await bd.rawQuery(sql);
    List<ItemCompra> lista = [];

    for (var task in listCompra) {
      lista.add(ItemCompra(task["id"], task["title"], task["qtd"]));
    }

    return lista;
  }

  saveItem(item, qtd) async {
    if (item.isNotEmpty && qtd != null) {
      Database bd = await getDatabase();

      Map<String, dynamic> dadosItem = {
        "title": "$item",
        "qtd": "$qtd",
      };
      return await bd.insert("lista_compras", dadosItem);
    }
  }

  deleteItem(id) async {
    if (id != null) {
      Database bd = await getDatabase();
      return await bd.rawQuery("DELETE FROM lista_compras where id = $id");
    }
  }
}
