import 'package:flutter/material.dart';
import 'package:view_videos/domain/entities/video_post.dart';
import 'package:view_videos/infrastructure/repositories/video_post_repository_impl.dart';

class DiscoverProvier extends ChangeNotifier {
  final VideoPostRepositoryImpl videoPostRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];
  DiscoverProvier({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 3));
    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();
    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    //Todo: cargar vídeos
    notifyListeners();
  }
}
