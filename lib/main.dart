import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:view_videos/config/theme/app_theme.dart';
import 'package:view_videos/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:view_videos/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:view_videos/ui/providers/discover_provider.dart';
import 'package:view_videos/ui/screens/discover/discover.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImpl(
        videoPostDatasource: LocalVideoDataSourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvier(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'View Videos',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
