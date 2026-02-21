import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_simulation/Features/Reels/Presentation/providers/video_player_notifier.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends ConsumerWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(videoPlayerProvider(videoUrl));
    final notifier = ref.read(videoPlayerProvider(videoUrl).notifier);
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      child: state.isInitialized
          ? GestureDetector(
              onTap: notifier.onVideoTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: state.controller!.value.aspectRatio,
                    child: VideoPlayer(state.controller!),
                  ),
                  if (state.showControls)
                    Container(
                      color: const Color.fromARGB(0, 0, 0, 0),
                      child: Icon(
                        state.isPlaying
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        color: Colors.white,
                        size: 75,
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: VideoProgressIndicator(
                      state.controller!,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Color.fromARGB(255, 0, 0, 0),
                        bufferedColor: Color.fromARGB(255, 237, 226, 226),
                        backgroundColor: Color.fromARGB(255, 247, 245, 245),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(51, 0, 0, 0),
                  shape: BoxShape.circle,
                ),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
    );
  }
}
