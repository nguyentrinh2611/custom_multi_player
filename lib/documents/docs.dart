String iframeHTML(String videoId) {
  return '''<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body { margin: 0; padding: 0; overflow: hidden; background: black; }
          iframe { width: 100vw; height: 200px; border: none; }
        </style>
  <script>
    function playWithSound() {
      var iframe = document.getElementById("ytplayer");
      var player = new YT.Player(iframe, {
        events: {
          "onReady": function(event) {
            event.target.setVolume(100); // Đặt âm lượng 100%
            event.target.playVideo(); // Chơi video
          }
        }
      });
    }

    function loadYouTubeAPI() {
      var tag = document.createElement("script");
      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName("script")[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    }

    loadYouTubeAPI();
  </script>
</head>
<body>
  <iframe
    id="ytplayer"
    type="text/html"
    width="100%"
    height="100%"
    src="https://www.youtube.com/embed/$videoId?enablejsapi=1&autoplay=1&mute=1"
    frameborder="0"
    allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen>
  </iframe>
</body>
</html>

''';
}
