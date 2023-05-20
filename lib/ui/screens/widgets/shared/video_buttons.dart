import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:view_videos/config/helpers/methods.dart';
import 'package:view_videos/domain/entities/video_post.dart';

class VideosButton extends StatelessWidget {
  final VideoPost video;
  const VideosButton({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          iconData: Icons.favorite,
          value: video.likes,
          iconColor: Colors.red,
        ),
        const SizedBox(height: 5),
        _CustomIconButton(
          iconData: Icons.remove_red_eye_outlined,
          value: video.views,
        ),
        const SizedBox(height: 5),
        _CustomIconButton(
          iconData: Icons.comment_bank_outlined,
          value: video.comments,
        ),
        const SizedBox(height: 5),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const _CustomIconButton(
            iconData: Icons.play_circle_outline,
            value: 0,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
          ),
        ),
        if (value > 0) Text(Methods.humanReadbleNumber(value)),
      ],
    );
  }
}
