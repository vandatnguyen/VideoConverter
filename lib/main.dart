import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_homework/setting.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String hihi = " ";
  List<Widget> _widgetOptions = [
    HomePage(),
    FolderPage(),
    AboutsPage(),
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getData() async {
//    http.get("https://pastebin.com/raw/QcZ8uk7L").then((value) {
//      print(value.body);
//    });
    var response = await http.get("https://pastebin.com/raw/QcZ8uk7L");

    setState(() {
      hihi = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
                ImageIcon(AssetImage("assets/images/ic_bottombar_home_pr.png")),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/ic_bottombar_files.png")),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon:
                ImageIcon(AssetImage("assets/images/ic_bottombar_abouts.png")),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff8f94fb),
        unselectedItemColor: Color(0xffdadee3),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Container(
//      child: Ra,
//        Text("Home")
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => SettingScreen()),
          );
        },
      ),
    );
  }
}

class FolderPage extends StatelessWidget {
  FolderPage();

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Folder"),
    );
  }
}

class AboutsPage extends StatelessWidget {
  AboutsPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Abouts"),
    );
  }
}
