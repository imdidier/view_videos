import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_videos/ui/providers/discover_provider.dart';

import '../widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DiscoverProvier discoverProvier = context.watch<DiscoverProvier>();
    return Scaffold(
      body: discoverProvier.initialLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 5,
                backgroundColor: Colors.purple,
              ),
            )
          : VideoScrollableView(
              videos: discoverProvier.videos,
            ),
    );
  }
}
