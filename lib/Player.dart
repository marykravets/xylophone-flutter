import 'PlayerAudioCache.dart';

class Player {
  static final player = new PlayerAudioCache();
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
}
