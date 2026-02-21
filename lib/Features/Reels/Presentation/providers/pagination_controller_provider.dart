import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reels_simulation/Features/Reels/Domain/entities/video_entity.dart';
import 'package:reels_simulation/Features/Reels/Presentation/providers/di.dart';

final reelsPagingControllerProvider =
    NotifierProvider<ReelsPagingNotifier, PagingState<int, Video>>(
      ReelsPagingNotifier.new,
    );

class ReelsPagingNotifier extends Notifier<PagingState<int, Video>> {
  @override
  PagingState<int, Video> build() {
    fetchNextPage();
    return PagingState();
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading || state.hasNextPage == false) return;

    state = state.copyWith(isLoading: true);

    final repository = ref.read(videoRepositoryProvider);

    final nextKey = (state.keys?.last ?? 0) + 1;
    if (nextKey > 3) {
      state = state.copyWith(hasNextPage: false);
      return;
    }

    final newItems = await repository.getVideos(page: nextKey, pageSize: 10);

    state = state.copyWith(
      pages: [...?state.pages, newItems],
      keys: [...?state.keys, nextKey],
      hasNextPage: newItems.isNotEmpty,
      isLoading: false,
    );
  }
}
