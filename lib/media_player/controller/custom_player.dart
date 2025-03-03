// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo_player/media_player/controller/video_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomPlayer {
  VideoController? videoController;
  YoutubePlayerController? youtubeController;
  bool isYoutube;
  CustomPlayer({
    required String url,
    required bool youtube,
    bool enablePlayLoop = true,
    bool autoPlay = false,
    bool disableSound = false,
  }) : isYoutube = youtube {
    if (isYoutube) {
      youtubeController =
          YoutubePlayerController(params: const YoutubePlayerParams())
            ..loadVideoById(videoId: url);
    } else {
      videoController = VideoController(
          url: url,
          autoPlay: autoPlay,
          disableSound: disableSound,
          enablePlayLoop: enablePlayLoop);
    }
  }

  void initialize() {
    if (!isYoutube) {
      videoController?.initialize();
    }
  }

  void play() {
    if (isYoutube) {
    } else {
      videoController?.play();
    }
  }

  void pause() {
    if (isYoutube) {
    } else {
      videoController?.pause();
    }
  }

  void dispose() {
    videoController?.dispose();
  }
}
