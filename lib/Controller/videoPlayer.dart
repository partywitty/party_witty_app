import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../ApiServices/api_link.dart';

class videoPlayer extends StatefulWidget {
  var videoUrl;
  videoPlayer({Key? key,this.videoUrl}) : super(key: key);

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Video",),
      ),
      body: FlickVideoPlayer(
        flickManager: FlickManager(
          autoPlay: false,
          videoPlayerController:
          //VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
          VideoPlayerController.network("${Api_link.imageUrl}${widget.videoUrl}"),
        ),
        flickVideoWithControls: const FlickVideoWithControls(
          controls: FlickPortraitControls(),
        ),
        flickVideoWithControlsFullscreen: const FlickVideoWithControls(
          controls: FlickLandscapeControls(),
        ),
      ),
    );
  }
}
