import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_simulation/Features/Reels/Presentation/models/video_state_model.dart';
import 'package:video_player/video_player.dart';

final videoPlayerProvider =
    NotifierProvider.family<VideoPlayerNotifier, VideoPlayerStateModel, String>(
      VideoPlayerNotifier.new,
    );

class VideoPlayerNotifier extends Notifier<VideoPlayerStateModel> {
  VideoPlayerNotifier(this.videoUrl);
  final String videoUrl;

  @override
  VideoPlayerStateModel build() {
    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    controller.initialize().then((_) {
      // await Future.delayed(const Duration(seconds: 3));
      state = state.copyWith(controller: controller, isInitialized: true);
      controller.play();
    });

    controller.addListener(() {
      state = state.copyWith(isPlaying: controller.value.isPlaying);
    });

    ref.onDispose(() {
      controller.dispose();
    });

    return VideoPlayerStateModel(controller: controller);
  }

  void togglePlayPause() {
    final controller = state.controller;
    if (controller == null) return;

    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  void onVideoTap() {
    togglePlayPause();

    state = state.copyWith(showControls: true);

    Future.delayed(const Duration(seconds: 1), () {
      state = state.copyWith(showControls: false);
    });
  }
}
