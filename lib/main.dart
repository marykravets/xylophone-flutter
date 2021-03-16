import 'package:flutter/material.dart';
import 'PlayerUI.dart';
import 'Player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  static final Color mainBackground = Colors.black;

  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {

  @override
  Widget build(BuildContext context) {

    Player.init();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: XylophoneApp.mainBackground,
        body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: PlayerUI.getKeys(),
            ),
      ),
    );
  }
}
