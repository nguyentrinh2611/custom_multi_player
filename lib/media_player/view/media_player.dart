import 'package:custom_mutli_player/media_player/controller/custom_player.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MediaPlayer extends StatefulWidget {
  const MediaPlayer({super.key});

  @override
  State<MediaPlayer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MediaPlayer> {
  List<CustomPlayer> controllers = [];
  List<WebViewController> webViewController = [];
  PageController controller = PageController();
  List<String> urls = [
    'vG0TQeiGHDQ',
    'Z1D26z9l8y8',
    'Y0CljZAbnSc',
    'q2YUtZum9wc',
    'abPmZCZZrFA'
  ];

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  _initPlayer() {
    CustomPlayer player = CustomPlayer(
        url: urls[0], youtube: true, autoPlay: true, disableSound: false);
    CustomPlayer player1 = CustomPlayer(
        url: urls[1], youtube: true, autoPlay: true, disableSound: false);
    player1.initialize();
    player.initialize();
    player.play();
    controllers.add(player);
    controllers.add(player1);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: PageView.builder(
          allowImplicitScrolling: true,
          scrollDirection: Axis.vertical,
          controller: controller,
          itemCount: urls.length,
          onPageChanged: (value) {
            if (value == 1) {
              controllers[1].play();
            }
          },
          itemBuilder: (context, index) {
            return YoutubePlayerScaffold(
                videoId: urls[index],
                backgroundColor: Colors.black,
                aspectRatio: 16 / 9,
                enableFullScreenOnVerticalDrag: false,
                builder: (context, player) {
                  return Center(
                    child: player,
                  );
                },
                controller: controllers[index].youtubeController!);
          },
        ),
      ),
    );
  }
}
