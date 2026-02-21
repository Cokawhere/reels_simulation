import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_simulation/Features/Reels/Data/datasource/video_remote_data_source.dart';
import 'package:reels_simulation/Features/Reels/Data/repository_impl/video_repository_imp.dart';
import 'package:reels_simulation/Features/Reels/Domain/repository/video_repository.dart';
import '../../../../Core/network/dio/dio_configration.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioConfigration.create();
});

final dataSourceRepositoryProvider = Provider<VideoRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return DataSourceImpl(dio);
});

final videoRepositoryProvider = Provider<VideoRepositiry>((ref) {
  final remote = ref.watch(dataSourceRepositoryProvider);
  return VideoRepositoryImp(remote);
});
