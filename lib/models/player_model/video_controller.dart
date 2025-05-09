import 'package:video_player/video_player.dart';

class VideoController extends VideoPlayerController {
  final String url;
  final bool enablePlayLoop;
  final bool autoPlay;
  final bool disableSound;

  bool isPaused = false;

  VideoController(
      {required this.url,
      this.enablePlayLoop = true,
      this.autoPlay = false,
      this.disableSound = false})
      : super.networkUrl(Uri.parse(url));

  @override
  Future<void> initialize() async {
    if (value.isInitialized) return Future.value();

    value = value.copyWith(
      isPlaying: autoPlay,
      isLooping: enablePlayLoop,
      volume: disableSound ? 0 : 1,
    );

    await super.initialize();
  }
}
