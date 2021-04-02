import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayerAudioCache extends AudioCache {

  Future<AudioPlayer> play(
      String fileName, {
        double volume = 1.0,
        bool? isNotification,
        PlayerMode mode = PlayerMode.LOW_LATENCY,
        bool stayAwake = false,
        bool recordingActive = false,
        bool? duckAudio,
      }) async {
    final String url = await getAbsoluteUrl(fileName);
    final AudioPlayer player = new AudioPlayer(mode: mode);
    player.setReleaseMode(ReleaseMode.STOP);
    await player.play(
      url,
      volume: volume,
      respectSilence: isNotification ?? respectSilence,
      stayAwake: stayAwake,
      recordingActive: recordingActive,
      duckAudio: duckAudio ?? this.duckAudio,
    );
    return player;
  }
}
