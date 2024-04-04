import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:soundboard/src/util/file_share_util.dart';
import 'package:soundboard/src/util/quotes_list.dart';
import 'package:soundboard/src/widget/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<FileShareUtil>(FileShareUtil());
  GetIt.I.registerSingleton<AudioPlayer>(AudioPlayer());

  runApp(const App(ALL_QUOTES));
}
