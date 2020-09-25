import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String name = "haha";
  int tuoi = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hihi"),
      ),
      body: Container(
        child: Text("$name $tuoi"),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
//    http.get("https://pastebin.com/raw/QcZ8uk7L").then((value) {
//      print(value.body);
//    });
    var response = await http.get("https://pastebin.com/raw/QcZ8uk7L");
    var data = jsonDecode(response.body);
    setState(() {
      name = data["name"];
      tuoi = data["age"];
    });
  }
}
