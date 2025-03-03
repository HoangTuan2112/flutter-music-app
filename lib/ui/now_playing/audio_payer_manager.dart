import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerManager{
  AudioPlayerManager({
    required this.songUrl,
  });
  final player = AudioPlayer();
  Stream<DurationState>? durationState;
  String songUrl;
  void init(){
    durationState = Rx.combineLatest2<Duration,PlaybackEvent,DurationState>(
      player.positionStream,player.playbackEventStream,
        (positon,playbackEvent) => DurationState(
          progress: positon,
          buffered: playbackEvent.bufferedPosition,
          total: playbackEvent.duration,
        ));
    player.setUrl(songUrl);

  }
  void dispose(){
    player.dispose();
  }

  void updateSong(String source) {
    songUrl = source;
    init();
  }
}
class DurationState {
  final dynamic buffered;

  final dynamic progress;

  final dynamic total;

  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });
}
