import 'package:view_videos/domain/datasource/video_post_datasource.dart';
import 'package:view_videos/domain/entities/video_post.dart';
import 'package:view_videos/infrastructure/models/local_video_model.dart';
import 'package:view_videos/shared/data/local_video_posts.dart';

class LocalVideoDataSourceImpl implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 1));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
