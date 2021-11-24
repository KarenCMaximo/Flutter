import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  String? sexo = "Feminino";
  String? escolaridade = "Ensino Fundamental";
  var isBrasileiro = false;
  double limite = 0.0;
  String resultado = "";
  var info = false;

  void _setResultado() {
    setState(() {
      this.info = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abertura de Conta"),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.white,
      body: _corpo(),
    );
  }

  _corpo() {
    return Container(
        color: Colors.green[100],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _inputText('Nome', nome),
            _inputText('Idade', idade),
            _dropdownSexo(),
            _dropdownEscolaridade(),
            _switch(),
            _slider(),
            RaisedButton(
              color: Colors.green[300],
              onPressed: this._setResultado,
              child: Text("Confirmar",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              padding:
                  EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
            ),
            _data(),
          ],
        ));
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
            fontSize: 18),
        controller: controller);
  }

  _dropdownSexo() {
    return DropdownButton<String>(
      isExpanded: true,
      value: sexo,
      items: <String>["Feminino", "Masculino"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 20,
      elevation: 12,
      onChanged: (String? valorSelecionado) {
        setState(() {
          sexo = valorSelecionado;
        });
      },
    );
  }

  _dropdownEscolaridade() {
    return DropdownButton<String>(
      isExpanded: true,
      value: escolaridade,
      items: <String>[
        "Ensino Fundamental",
        "Ensino Médio",
        "Graduação",
        "Pós Graduação",
        "Mestrado",
        "Doutorado"
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 20,
      elevation: 12,
      onChanged: (String? valorSelecionado) {
        setState(() {
          escolaridade = valorSelecionado;
        });
      },
    );
  }

  _switch() {
    return Container(
        child: Row(
      children: [
        Text("Brasileiro:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Switch(
          value: isBrasileiro,
          onChanged: (value) {
            setState(() {
              isBrasileiro = value;
            });
          },
          activeTrackColor: Colors.blue[100],
          activeColor: Colors.blue,
        )
      ],
    ));
  }

  _slider() {
    return Container(
        child: Row(
      children: [
        Text("Limite",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Slider(
          value: limite,
          min: 0,
          max: 2000,
          divisions: 100,
          label: limite.round().toString(),
          onChanged: (double value) {
            setState(() {
              limite = value;
            });
          },
        )
      ],
    ));
  }

  _data() {
    if (this.info) {
      return Container(
          child: Column(
        children: [
          Text("Nome: ${nome.text}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Idade: ${idade.text}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Sexo: ${sexo.toString()}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Escolaridade: ${escolaridade}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Brasileiro: ${isBrasileiro ? "Sim" : "Não"}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Limite: ${limite}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ));
    } else {
      return Container(child: Row());
    }
  }
}
