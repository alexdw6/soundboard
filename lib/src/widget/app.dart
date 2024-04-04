import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../util/file_share_util.dart';
import '../util/quote.dart';

class App extends StatelessWidget {
  final List<Quote> _allQuotes;

  const App(this._allQuotes);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soundboard van de makkers",
      home: Quotes(_allQuotes),
    );
  }

  PlayerState getAudioPlayerState() => getAudioPlayerState();

}

class Quotes extends StatefulWidget {
  final List<Quote> _allQuotes;

  const Quotes(this._allQuotes);

  @override
  State<StatefulWidget> createState() => QuoteState(_allQuotes);

}

class QuoteState extends State<Quotes> {
  final List<Quote> _allQuotes;

  final FileShareUtil _fileShareUtil = GetIt.I<FileShareUtil>();
  final AudioPlayer _audioPlayer = GetIt.I<AudioPlayer>();

  QuoteState(this._allQuotes);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("Soundboard van de makkers"),
    ),
    body: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: _allQuotes.length,
                (context, index) {
                  Quote quote = _allQuotes[index];
                  return Card(
                    child: ListTile(
                      title: Text(quote.name),
                      onLongPress: () {
                        quote.shareAudio(context, _fileShareUtil);
                      },
                      onTap: () {
                        quote.play(_audioPlayer);
                      },
                    ),
                  );
                }
            )
        )
      ],
    )
  );

  int _computeColumnCount(BuildContext context) => MediaQuery.of(context).size.width ~/ 150;

}