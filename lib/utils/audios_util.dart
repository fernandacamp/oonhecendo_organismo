import 'dart:typed_data';
import 'package:assets_audio_player/assets_audio_player.dart';
import '../main.dart';

class AudioUtil{

  static void tocarAudio(AssetsAudioPlayer assetsAudioPlayer, String path) async {
    await assetsAudioPlayer.pause();
    assetsAudioPlayer.open(
      Audio("assets/audios/$path.mp3"),
      volume: GlobalVariables.volume
    );
  }

}