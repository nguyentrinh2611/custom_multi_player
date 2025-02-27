import 'dart:ui';

import 'package:video_player/video_player.dart';

class VideoValue extends VideoPlayerValue {
  // ignore: use_super_parameters
  const VideoValue({
    Duration duration = Duration.zero,
    Size size = Size.zero,
    Duration position = Duration.zero,
    bool isInitialized = false,
    bool isPlaying = false,
    bool isLooping = false,
    bool isBuffering = false,
    double volume = 1.0,
    double playbackSpeed = 1.0,
    String errorDescription = '',
    bool isCompleted = false,
  }) : super(
            duration: duration,
            size: size,
            position: position,
            isBuffering: isBuffering,
            isPlaying: isPlaying,
            isLooping: isLooping,
            playbackSpeed: playbackSpeed,
            volume: volume,
            errorDescription: errorDescription,
            isCompleted: isCompleted);
}
