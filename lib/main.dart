import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = new AudioCache();

  Expanded getNoteBtn(String sound, Color color) => Expanded(
      child: MaterialButton(
          onPressed: () {
            player.play(sound);
          },
          color: color)
  );

  String getNoteSound(int number) => "note$number.wav";

  List<Widget> getKeys() {
    return [
      getNoteBtn(getNoteSound(1), Colors.red),
      getNoteBtn(getNoteSound(2), Colors.orange),
      getNoteBtn(getNoteSound(3), Colors.amberAccent),
      getNoteBtn(getNoteSound(4), Colors.lightGreen),
      getNoteBtn(getNoteSound(5), Colors.blue),
      getNoteBtn(getNoteSound(6), Colors.lightBlueAccent),
      getNoteBtn(getNoteSound(7), Colors.pinkAccent),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: getKeys(),
              )),
        ),
      ),
    );
  }
}
