import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reels_simulation/Features/Reels/Domain/entities/video_entity.dart';
import 'package:reels_simulation/Features/Reels/Presentation/providers/di.dart';

final reelsPagingControllerProvider =
    Provider.autoDispose<PagingController<int, Video>>((ref) {
  final repository = ref.watch(videoRepositoryProvider);

  final controller = PagingController<int, Video>(
    getNextPageKey: (state) {
      if (state.lastPageIsEmpty) return null;
      final currentLastKey = state.keys?.last ?? 0;
      return currentLastKey + 1;
    },
    fetchPage: (pageKey) async {
      final newItems = await repository.getVideos(
        page: pageKey,
        pageSize: 10,
      );

      return newItems;
    },
  );

  ref.onDispose(controller.dispose);

  return controller;
});
