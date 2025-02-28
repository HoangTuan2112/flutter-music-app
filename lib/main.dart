import 'package:flutter/material.dart';

import 'data/repository/repository.dart';

Future<void> main() async {
  var repository = defaultRepository();
  var songs = await repository.getSources();
  if(songs != null){
    for(var song in songs){
      debugPrint(song.toString());
    }
  }
}
class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




