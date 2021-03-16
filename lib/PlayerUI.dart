import 'package:flutter/material.dart';
import 'Player.dart';

class PlayerUI {
  // static keys are faster
  static final List<Widget> _keys = _getKeys();
  static final List<Color> _colors = _getColors();

  static List<Widget> getKeys() => _keys;

  //#region private methods

  static Expanded _getNoteBtn(String sound, Color color) => Expanded(
      child: MaterialButton(
          onPressed: () {
            Player.play(sound);
          },
          color: color,
          child: GestureDetector (
            onHorizontalDragUpdate: (e) {
              Player.play(sound);
            }
          )
      )
  );

  static List<Widget> _getKeys() {
    final list = <Widget>[];

    for (int i = 1; i <= Player.getKeyCount(); i++) {
      list.add(_getNoteBtn(Player.getNoteSound(i), _colors[i]));
    }

    return list;
  }

  static List<Color> _getColors() {
    return [
      Colors.teal,
      Colors.red,
      Colors.orange,
      Colors.amberAccent,
      Colors.lightGreen,
      Colors.blue,
      Colors.lightBlueAccent,
      Colors.pinkAccent
    ];
  }

//#endregion
}
