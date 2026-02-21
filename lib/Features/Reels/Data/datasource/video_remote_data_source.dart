import 'package:dio/dio.dart';
import '../models/video_model.dart';

abstract class VideoRemoteDataSource {
  Future<List<VideoModel>> getVideos({
    required final int page,
    required final int pageSize,
  });
}

class DataSourceImpl implements VideoRemoteDataSource {
  final Dio dio;
  DataSourceImpl(this.dio);

  @override
  Future<List<VideoModel>> getVideos({
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await dio.get(
        '',
        queryParameters: {
          "page": page,
          'per_page': pageSize,
          'query': "new york",
        },
      );

      final videos = (response.data['videos'] as List);

      return videos.map((e) => VideoModel.fromJson(e)).toList();
    } on DioException catch (e) {
      print(e.message);
      return [];
    }
  }
}
