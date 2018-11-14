import 'package:flutterdemo/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new FlutterTest());

class FlutterTest extends StatefulWidget {

  @override
   _FTAppState createState() => new _FTAppState();
}

class _FTAppState extends State<FlutterTest> {

    @override
      Widget build(BuildContext context) {
        return new MaterialApp(
          title: "Flutter Learn",
          color: Colors.purple,
          home: new FTHomePage(
            title: "This is a test demo",
          )
        );
      }
}