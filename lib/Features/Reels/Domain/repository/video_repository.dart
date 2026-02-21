import '../entities/video_entity.dart';

abstract class VideoRepositiry {
  Future<List<Video>> getVideos({required int page, required int pageSize});
}
