import 'package:demo_player/media_player/controller/custom_player.dart';
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
  List<String> urls = ['-25y8Yu1vi4', 'vG0TQeiGHDQ'];

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  _initPlayer() {
    List.generate(
      urls.length,
      (index) {
        controllers.add(CustomPlayer(
            autoPlay: true,
            url: urls[index],
            youtube: !urls[index].contains('https'))
          ..initialize());
      },
    );
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
          onPageChanged: (value) {},
          itemBuilder: (context, index) {
            return YoutubeValueBuilder(
              controller: controllers[index].youtubeController!,
              builder: (p0, p1) {
                return YoutubePlayer(
                  aspectRatio: 9 / 16,
                  controller: controllers[index].youtubeController!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
