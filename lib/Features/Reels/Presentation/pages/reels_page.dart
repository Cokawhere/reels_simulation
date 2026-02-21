import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reels_simulation/Features/Reels/Domain/entities/video_entity.dart';
import 'package:reels_simulation/Features/Reels/Presentation/providers/pagination_controller_provider.dart';
import 'package:reels_simulation/Features/Reels/Presentation/widgets/video_player_widget.dart';

class ReelsPage extends ConsumerWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reelsPagingControllerProvider);
    final notifier = ref.read(reelsPagingControllerProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(49, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(82, 0, 0, 0),
        title: Text(
          "NewYork",
          style: TextStyle(
            color: const Color.fromARGB(133, 235, 230, 230),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: PagedPageView<int, Video>(
        state: state,
        fetchNextPage: notifier.fetchNextPage,
        scrollDirection: Axis.vertical,
        builderDelegate: PagedChildBuilderDelegate<Video>(
          firstPageProgressIndicatorBuilder: (_) => Center(
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
          noItemsFoundIndicatorBuilder: (_) => const Center(
            child: Text(
              "No videos found",
              style: TextStyle(color: Colors.white),
            ),
          ),
          noMoreItemsIndicatorBuilder: (_) => Container(
            color: Colors.black,
            child: const Center(
              child: Text(
                "There is no more videos",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          itemBuilder: (context, video, index) {
            return VideoPlayerWidget(videoUrl: video.url);
          },
        ),
      ),
    );
  }
}
