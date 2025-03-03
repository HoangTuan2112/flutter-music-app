import 'package:flutter/cupertino.dart';
import 'package:music_app/data/model/song.dart';
import 'package:music_app/data/source/source.dart';

abstract interface class Repository {
  Future<List<Song>?> getSources();
}

class DefaultRepository implements Repository {
  final DataSource _remoteDataSource = RemoteDataSource();
  final DataSource _localDataSource = LocalDataSource();

  @override
  Future<List<Song>?> getSources() async {
    List<Song> songs = [];
    await _remoteDataSource.getSources().then((remoteSongs) {
      if (remoteSongs == null) {
        _localDataSource.getSources().then((localSongs) {
          if (localSongs != null) {
            songs.addAll(localSongs);
          }
        });
      } else {
        songs.addAll(remoteSongs);
      }
    });
    return songs;
  }
}
