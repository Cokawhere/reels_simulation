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
    final paginationController = ref.watch(reelsPagingControllerProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(49, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(84, 0, 0, 0),
        title: Text(
          "NewYork",
          style: TextStyle(
            color: const Color.fromARGB(133, 43, 40, 40),
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: PagedPageView<int, Video>(
        state: paginationController.value,
        fetchNextPage: paginationController.fetchNextPage,
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
          itemBuilder: (context, video, index) {
            return VideoPlayerWidget(videoUrl: video.url);
          },
        ),
      ),
    );
  }
}
