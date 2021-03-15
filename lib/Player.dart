import 'package:audioplayers/audio_cache.dart';

class Player {
  static final player = new AudioCache();
  static final int _keysCount = 7;

  static final List<String> _fileNames = getFileNames();

  static init() {
    for (int i = 1; i <= _keysCount; i++) {
      player.fetchToMemory("note$i.wav");
    }
    player.loadAll(_fileNames);
  }

  static List<String> getFileNames() {
    final List<String> fileNames = <String>[];

    for (int i = 1; i <= _keysCount; i++) {
      fileNames.add("note$i.wav");
    }

    return fileNames;
  }

  static int getKeyCount() => _keysCount;

  static String getNoteSound(int number) {
    if (number > 0 && number <= _keysCount && _fileNames.isNotEmpty) {
      return _fileNames.elementAt(number - 1);
    }
    return "";
  }

  static Future<void> play(String sound) async {
    if (sound.isNotEmpty) {
      player.play(sound);
    }
  }

  static Future<void> playAllForward() async {
    for (int i = 1; i <= _keysCount; i++) {
      _play(i);
    }
  }

  static Future<void> playAllBackward() async {
    for (int i = _keysCount; i > 1; i--) {
      _play(i);
    }
  }

  static Future<void> _play(int i) async {
    if (i > 0) {
      player.play(getNoteSound(i));
    }
  }
}
