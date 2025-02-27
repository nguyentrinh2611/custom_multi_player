// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo_player/media_player/controller/video_controller.dart';
import 'package:demo_player/media_player/controller/youtube_controller.dart';
import 'package:video_player/video_player.dart';
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
      youtubeController = YoutubePlayerController(params: YoutubePlayerParams())
        ..loadVideoById(videoId: url);
      // youtubeController = YoutubeController(
      //     url: url,
      //     autoPlay: autoPlay,
      //     disableSound: disableSound,
      //     enablePlayLoop: enablePlayLoop)
      //   ..loadVideoById(videoId: url)
      //   ..listen(onDone: () {
      //     youtubeController?.playVideo();
      //   }, (value) async {
      //     print("$value");
      //   });
      // ..toggleFullScreen(lock: false)
      // ..enterFullScreen(lock: false);
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
      // youtubeController?.play();
    } else {
      videoController?.play();
    }
  }

  void pause() {
    if (isYoutube) {
      // youtubeController?.pause();
    } else {
      videoController?.pause();
    }
  }

  void dispose() {
    // youtubeController?.dispose();
    videoController?.dispose();
  }
}
