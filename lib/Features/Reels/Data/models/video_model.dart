import '../../Domain/entities/video_entity.dart';

class VideoModel extends Video {
  VideoModel({required super.id, required super.fileType, required super.url});

  factory VideoModel.fromJson(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'],
      fileType: map['fileType'],
      url: map['video_files'][3]['link'],
    );
  }
}
