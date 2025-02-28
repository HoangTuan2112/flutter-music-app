
import 'dart:convert';

import 'package:music_app/data/model/song.dart';
import 'package:http/http.dart' as http;

abstract interface class DataSource {
  Future<List<Song>?> getSources();
}

class RemoteDataSource implements DataSource{
  @override
  Future<List<Song>?> getSources() async {
    const url ='https://thantrieu.com/resources/braniumapis/songs.json';
    final uri = Uri.parse(url);
    final response= await http.get(uri);
    if(response.statusCode == 200){
      final bodyContent = utf8.decode(response.bodyBytes);
      var songWrapper = jsonDecode(bodyContent) as Map;
      var songList = songWrapper['songs']as List;
      var songs = songList.map((e) => Song.fromJson(e)).toList();
      return songs;
  }
  else {
    return null;
  }

}
}
class LocalDataSource implements DataSource{
  @override
  Future<List<Song>?> getSources() async {
    return null;
  }
}

