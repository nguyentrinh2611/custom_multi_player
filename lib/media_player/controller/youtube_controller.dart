import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeController extends YoutubePlayerController {
  final String url;
  final bool enablePlayLoop;
  final bool autoPlay;
  final bool disableSound;

  bool isPaused = false;

  YoutubeController(
      {required this.url,
      this.enablePlayLoop = true,
      this.autoPlay = false,
      this.disableSound = false})
      : super(
            params: const YoutubePlayerParams(
                showVideoAnnotations: false,
                showFullscreenButton: true,
                loop: true));
}
