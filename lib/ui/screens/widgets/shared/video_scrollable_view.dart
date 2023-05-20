import 'package:flutter/material.dart';
import 'package:view_videos/ui/screens/widgets/shared/video_buttons.dart';

import '../../../../domain/entities/video_post.dart';
import '../video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({required this.videos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost video = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: video.vodeoUrl,
                caption: video.caption,
              ),
            ),
            Positioned(
              bottom: 40,
              right: 20,
              child: VideosButton(
                video: video,
              ),
            ),
          ],
        );
      },
    );
  }
}
