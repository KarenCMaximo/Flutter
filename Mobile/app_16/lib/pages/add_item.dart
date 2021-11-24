import 'package:app_16/classes/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController titleController = TextEditingController();
  TextEditingController qtdController = TextEditingController();
  var database = DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo Item"),
        ),
        body: Container(
          child: Column(
            children: [_buildForm()],
          ),
        ));
  }

  Widget _buildForm() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Mercadoria",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20),
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Quantidade",
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20),
              controller: qtdController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await database.saveItem(
                    titleController.text, qtdController.text);
                Navigator.pop(context);
              },
              child: Text("Adicionar Item"))
        ],
      ),
    );
  }
}
