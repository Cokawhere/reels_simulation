import 'package:reels_simulation/Features/Reels/Domain/entities/video_entity.dart';
import '../../Domain/repository/video_repository.dart';
import '../datasource/video_remote_data_source.dart';

class VideoRepositoryImp implements VideoRepositiry{
  final VideoRemoteDataSource remote;
  VideoRepositoryImp(this.remote);

  @override
  Future<List<Video>> getVideos({required int page, required int pageSize}){
    return remote.getVideos(page: page, pageSize: pageSize);
  }
}