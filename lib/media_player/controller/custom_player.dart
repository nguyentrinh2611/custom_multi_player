// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_mutli_player/media_player/controller/video_controller.dart';
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
    if (isYoutube) {
      // youtubeController = YoutubePlayerController(
      //     params: const YoutubePlayerParams(showFullscreenButton: true))
      //   ..loadVideoById(videoId: url);
    } else {
      videoController = VideoController(
          url: url,
          autoPlay: autoPlay,
          disableSound: disableSound,
          enablePlayLoop: enablePlayLoop);
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
