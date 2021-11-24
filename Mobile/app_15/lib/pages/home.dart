import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDarkMode = false;
  bool isSmall = false;

  _getValues() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isDarkMode = prefs.getBool("isDarkMode")!;
      isSmall = prefs.getBool("isSmall")!;
    });
  }

  _saveValues() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDarkMode", this.isDarkMode);
    prefs.setBool("isSmall", this.isSmall);
  }

  @override
  void initState() {
    this._getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Frases"),
        ),
        body: Container(
          child: Column(
            children: [_buildForm(), _buildVisualization()],
          ),
        ));
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text("Dia:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  _saveValues();
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeTrackColor: Colors.black45,
                activeColor: Colors.purple,
              ),
            ],
          ),
          Row(
            children: [
              Text("Pequeno:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Switch(
                value: isSmall,
                onChanged: (value) {
                  _saveValues();
                  setState(() {
                    isSmall = value;
                  });
                },
                activeTrackColor: Colors.black45,
                activeColor: Colors.purple,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildVisualization() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45),
          color: !this.isDarkMode ? Colors.black45 : Colors.white),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height / 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "O único passo entre o sonho e a realidade é a atitude!",
              style: TextStyle(
                fontSize: this.isSmall ? 12 : 76,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
