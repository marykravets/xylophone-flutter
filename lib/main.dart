import 'package:flutter/material.dart';
import 'PlayerUI.dart';
import 'Player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  static final Color mainBackground = Colors.black;
  double _y = 0;
  double _offset = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainBackground,
        body: GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: PlayerUI.getKeys(),
            ),
            onVerticalDragStart: (e) {
              _y = e.globalPosition.dy;
            },
            onVerticalDragUpdate: (e) {
              _onVerticalDrag(e);
            }),
      ),
    );
  }

  void _onVerticalDrag(DragUpdateDetails e) {
    if (e.globalPosition.dx - _offset > _offset) {
      if (e.globalPosition.dy - _offset > _y) {
        Player.playAllForward();
      } else if (e.globalPosition.dy + _offset < _y) {
        Player.playAllBackward();
      }
    }
  }
}
