import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:soundboard/src/util/file_share_util.dart';


// class Quote {
//   // final FileShareUtil fileShareUtil = GetIt.I<FileShareUtil>();
//   // final AudioPlayer audioPlayer = GetIt.I<AudioPlayer>();
//   final String fileName;
//   final String name;
//
//   const Quote(this.fileName, this.name);
//
//   Future shareAudio(BuildContext context) async {
//     final fullFileName = '$fileName.wav';
//     await FileShareUtil().shareFile(name, fullFileName, context);
//   }
//
//   Future play() async {
//     await AudioPlayer().stop();
//     AudioPlayer().play(AssetSource('sounds/$fileName.wav'));
//   }
// }

class Quote {
  final String fileName;
  final String name;

  const Quote(this.fileName, this.name);

  Future shareAudio(BuildContext context, FileShareUtil fileShareUtil) async {
    final fullFileName = '$fileName.wav';
    await fileShareUtil.shareFile(name, fullFileName, context);
  }

  Future play(AudioPlayer audioPlayer) async {
    await audioPlayer.stop();
    audioPlayer.play(AssetSource('sounds/$fileName.wav'));
  }
}
