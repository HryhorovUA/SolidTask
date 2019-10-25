import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_solid/main.dart';

class NumberApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NumberAppState();
  }
}

class _NumberAppState extends State<NumberApp> {
  var _apps = ['Random Color', 'Random Number'];

  int _numberOfClick = 0;
  int _randomNumber = -1;

  void _onClicked() {
    setState(() {
      _randomNumber = Random().nextInt(10);
      _numberOfClick++;
    });
  }

  String _showText() {
    if (_randomNumber == -1) {
      return '?';
    } else {
      return _randomNumber.toString();
    }
  }

  void _changeScreen() {
    Navigator.pop(context);
  }

  _resetButtonClicked() {
    setState(() {
      _randomNumber = -1;
      _numberOfClick = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Random Number"),
        ),
        body: GestureDetector(
          onTap: () {
            _onClicked();
          },
          child: Container(
              color: Colors.orangeAccent,
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
                      if (newValueSelected == _apps[0]) {
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
                        _showText(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 65.0,
                        ),
                      ),
                      Text(
                        "Number of tap: $_numberOfClick",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  ),
                  Container(
                    height: 100.0,
                  ),
                  RaisedButton(
                    color: Colors.deepOrange,
                    textColor: Colors.black,
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
