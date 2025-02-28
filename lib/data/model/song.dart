// "songs": [
// {
// "id": "1121429554",
// "title": "Chạy Về Khóc Với Anh",
// "album": "Chạy Về Khóc Với Anh(Single)",
// "artist": "ERIK",
// "source": "https://thantrieu.com/resources/music/1121429554.mp3",
// "image": "https://thantrieu.com/resources/arts/1121429554.webp",
// "duration": 224,
// "favorite": "false",
// "counter": 20,
// "replay": 0
// }

class Song {
  final String id;
  final String title;
  final String album;
  final String artist;
  final String source;
  final String image;
  final int duration;
  final bool favorite;
  final int counter;
  final int replay;

  Song({
    required this.id,
    required this.title,
    required this.album,
    required this.artist,
    required this.source,
    required this.image,
    required this.duration,
    required this.favorite,
    required this.counter,
    required this.replay,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      album: json['album'],
      artist: json['artist'],
      source: json['source'],
      image: json['image'],
      duration: json['duration'],
      favorite: json['favorite'],
      counter: json['counter'],
      replay: json['replay'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Song && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}