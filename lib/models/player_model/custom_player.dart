// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_mutli_player/models/player_model/video_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomPlayer {
  VideoController? videoController;
  YoutubePlayerController? youtubeController;
  bool isYoutube;
  String url;
  CustomPlayer({
    required this.url,
    required bool youtube,
    bool enablePlayLoop = true,
    bool autoPlay = false,
    bool disableSound = false,
  }) : isYoutube = youtube {
    if (!youtube) {
      videoController = VideoController(
          url: url,
          enablePlayLoop: enablePlayLoop,
          autoPlay: autoPlay,
          disableSound: disableSound);
    }
  }

  void initialize() async {
    if (!isYoutube) {
      videoController?.initialize();
    } else {
      youtubeController = YoutubePlayerController(
          params:
              const YoutubePlayerParams(showFullscreenButton: true, loop: true))
        ..loadVideoById(videoId: url);
      await youtubeController?.pauseVideo();
    }
  }

  void play() {
    if (isYoutube) {
      youtubeController?.playVideo();
    } else {
      videoController?.play();
    }
  }

  Future<void> pause() async {
    await youtubeController?.pauseVideo();
    await videoController?.pause();
  }

  Future<void> dispose() async {
    await youtubeController?.close();
    await videoController?.dispose();
  }
}
