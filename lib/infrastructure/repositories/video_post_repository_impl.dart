import 'package:view_videos/domain/datasource/video_post_datasource.dart';
import 'package:view_videos/domain/entities/video_post.dart';

import '../../domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videoPostDatasource;

  VideoPostRepositoryImpl({
    required this.videoPostDatasource,
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostDatasource.getTrendingVideosByPage(page);
  }
}
