import 'package:app_16/classes/Database.dart';
import 'package:app_16/pages/add_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var lista = [];
  var database = DatabaseHelper();

  handleGetLista() async {
    var listaDB = await database.getLista();
    setState(() {
      this.lista = listaDB;
    });
  }

  @override
  void initState() {
    super.initState();
    this.handleGetLista();
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItem()),
          ).then((value) => handleGetLista());
        },
        child: Icon(Icons.plus_one),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${lista[index].title} (${lista[index].qtd})"),
            trailing: GestureDetector(
              onTap: () async {
                var item = lista[index];
                await database.deleteItem(item.id);
                this.handleGetLista();
              },
              child: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}

class ItemCompra {
  final id;
  final title;
  final qtd;

  ItemCompra(this.id, this.title, this.qtd);
}
