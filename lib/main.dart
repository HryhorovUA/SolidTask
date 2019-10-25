import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_solid/NumberApp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SOLID',
    home: TestApp(),
  ));
}

class TestApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestAppState();
  }
}

class _TestAppState extends State<TestApp> {
  List<Color> _colors = [
    Colors.cyan,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.deepOrange,
    Colors.red,
    Colors.white,
    Colors.deepPurple,
    Colors.blue,
    Colors.tealAccent,
    Colors.purpleAccent,
    Colors.lime
  ];

  var _apps = ['Random Color', 'Random Number'];

  int _currentIndex = 0;
  int _numberOfChange = 0;

  void _onChange() {
    int _colorSize = _colors.length;

    setState(() {
      _currentIndex = Random().nextInt(_colorSize);
      _numberOfChange++;
    });
  }

  void _changeScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NumberApp()));
  }

  void _resetButtonClicked() {
    setState(() {
      _numberOfChange = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Random Color"),
        ),
        body: GestureDetector(
          onTap: () {
            _onChange();
          },
          child: Container(
              color: _colors[_currentIndex],
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                    items: _apps.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _apps[0],
                    onChanged: (String newValueSelected) {
                      if (newValueSelected == _apps[1]) {
                        _changeScreen();
                      }
                    },
                  ),
                  Container(
                    height: 200.0,
                  ),
                  Center(
                      child: Column(
                    children: <Widget>[
                      Text(
                        "Hey there!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                        ),
                      ),
                      Text(
                        "Number of tap: $_numberOfChange",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),),
                  Container(
                    height: 100.0,
                  ),
                  RaisedButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text(
                        "Reset"
                    ),
                    onPressed: (){
                      _resetButtonClicked();
                    },
                  )
                ],
              )),
        ));
  }
}
