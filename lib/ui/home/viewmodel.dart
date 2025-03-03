import 'dart:async';

import 'package:music_app/data/model/song.dart';
import 'package:music_app/data/repository/repository.dart';

class MuscicAppViewModel{
  StreamController<List<Song>> songStream= StreamController();
  void getSongs(){
    final repository = DefaultRepository();
    repository.getSources().then((values)=>{
      songStream.add(values!),
    });
  }
}
