import 'package:video_player/video_player.dart';

class VideoPlayerStateModel {
  final VideoPlayerController? controller;
  final bool isInitialized;
  final bool isPlaying;
  final bool isLoading;
  final bool showControls;

  VideoPlayerStateModel({
    this.controller,
    this.isInitialized = false,
    this.isPlaying = false,
    this.isLoading = true,
    this.showControls = false,
  });

  VideoPlayerStateModel copyWith({
    VideoPlayerController? controller,
    bool? isInitialized,
    bool? isPlaying,
    bool? isLoading,
    bool? showControls,
  }) {
    return VideoPlayerStateModel(
      controller: controller ?? this.controller,
      isInitialized: isInitialized ?? this.isInitialized,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
      showControls: showControls ?? this.showControls,
    );
  }
}
