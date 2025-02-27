import 'package:demo_player/documents/docs.dart';
import 'package:demo_player/media_player/controller/custom_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _initPlayer();
  // }
  // _initPlayer() {
  //   List.generate(urls.length, (index) {
  //     webViewController.add(WebViewController.fromPlatformCreationParams(
  //         const PlatformWebViewControllerCreationParams())
  //       ..loadHtmlString(iframeHTML(urls[0]))
  //       ..setJavaScriptMode(JavaScriptMode.unrestricted));
  //   });
  // }
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

  // Future<void> openYouTubeVideo(String videoId) async {
  //   await launchUrl(Uri.parse('https://www.youtube.com/watch?v=$videoId'),
  //       mode: LaunchMode.externalApplication);
  //   // final Uri url = Uri.parse('vnd.youtube://$videoId'); // Opens in YouTube app
  //   // if (!await launchUrl(url)) {
  //   //   await launchUrl(Uri.parse('https://www.youtube.com/watch?v=$videoId'),
  //   //       mode: LaunchMode.externalApplication);
  //   // }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   for (var controller in controllers) {
  //     controller.dispose();
  //   }
  // }

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
            // return WebViewWidget(
            //   controller: webViewController[index],
            //   gestureRecognizers: {Factory(() => EagerGestureRecognizer())},
            // );
            // return YoutubePlayerScaffold(
            //     autoFullScreen: false,
            //     enableFullScreenOnVerticalDrag: false,
            //     builder: (context, player) {
            //       return Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [player],
            //       );
            //     },
            //     controller: controllers[index].youtubeController!);
            return YoutubeValueBuilder(
              controller: controllers[index].youtubeController!,
              builder: (p0, p1) {
                return YoutubePlayer(
                  aspectRatio: 9 / 16,
                  controller: controllers[index].youtubeController!,
                );
              },
            );

            // return !urls[index].contains('https')
            //     ? YoutubePlayer(
            //         onReady: () {
            //           print('===================>');
            //           controllers[index].play();
            //         },
            //         topActions: [],
            //         bottomActions: [
            //           const CurrentPosition(),
            //           const ProgressBar(
            //             isExpanded: true,
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               openYouTubeVideo(urls[index]);
            //             },
            //             child: Image.asset(
            //               'assets/icon/youtube_logo.png',
            //               width: 50,
            //               height: 50,
            //             ),
            //           ),
            //           const FullScreenButton()
            //         ],
            //         showVideoProgressIndicator: true,
            //         controller: controllers[index].youtubeController!)
            //     : VideoPlayer(controllers[index].videoController!);
          },
        ),
      ),
    );
  }
}
