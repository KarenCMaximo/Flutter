import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valor = TextEditingController();
  String? valorDe = "Dólar";
  String? valorPara = "Real";
  String? currency = "";
  double result = 0.0;

  void _setResult() {
    setState(() {
      if (valorDe == "Dólar") {
        if (valorPara == "Euro") {
          currency = "\$";
          result = double.parse(valor.text) * 0.89;
        } else if (valorPara == "Real") {
          currency = "R\$";
          result = double.parse(valor.text) * 5.61;
        } else {
          currency = "€";
          result = double.parse(valor.text);
        }
      } else if (valorDe == "Real") {
        if (valorPara == "Euro") {
          currency = "\$";
          result = double.parse(valor.text) * 0.16;
        } else if (valorPara == "Dólar") {
          currency = "\$";
          result = double.parse(valor.text) * 0.18;
        } else {
          currency = "R\$";
          result = double.parse(valor.text);
        }
      } else if (valorDe == "Euro") {
        if (valorPara == "Real") {
          currency = "R\$";
          result = double.parse(valor.text) * 6.33;
        } else if (valorPara == "Dólar") {
          currency = "\$";
          result = double.parse(valor.text) * 1.16;
        } else {
          currency = "\$";
          result = double.parse(valor.text);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: Colors.black,
      body: _corpo(),
    );
  }

  _corpo() {
    return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            color: Colors.yellow[100]),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _inputText('Valor', valor),
            _dropdownValueFrom(),
            _dropdownValueTo(),
            RaisedButton(
              color: Colors.yellow[400],
              onPressed: this._setResult,
              child: Text("Converter",
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              padding:
                  EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
            ),
            _result()
          ],
        ));
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.yellow[800],
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.yellow[800],
            fontWeight: FontWeight.bold,
            fontSize: 18),
        controller: controller);
  }

  _dropdownValueTo() {
    return DropdownButton<String>(
      isExpanded: true,
      value: valorPara,
      items: <String>["Dólar", "Real", "Euro"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_drop_down_sharp),
      iconSize: 22,
      elevation: 14,
      onChanged: (String? valorSelecionado) {
        setState(() {
          valorPara = valorSelecionado;
        });
      },
    );
  }

  _dropdownValueFrom() {
    return DropdownButton<String>(
      isExpanded: true,
      value: valorDe,
      items: <String>["Dólar", "Real", "Euro"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_drop_down_sharp),
      iconSize: 22,
      elevation: 14,
      onChanged: (String? valorSelecionado) {
        setState(() {
          valorDe = valorSelecionado;
        });
      },
    );
  }

  _result() {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text("Resultado ${currency} ${result.toStringAsPrecision(4)}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )));
  }
}
