import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContainer extends StatefulWidget {
  const VideoContainer({Key? key}) : super(key: key);

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=P3l9o31AoeQ')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return videoController.value.isInitialized
        ? AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(videoController),
                VideoProgressIndicator(videoController, allowScrubbing: true),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white24,
                    onPressed: () {
                      setState(() {
                        videoController.value.isPlaying
                            ? videoController.pause()
                            : videoController.play();
                      });
                    },
                    child: Icon(
                      videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
