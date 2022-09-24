import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/screens/video_list.dart';
import 'package:video_player_app/utils/colours.dart';

// ignore: must_be_immutable
class VideoPlayScreen extends StatefulWidget {
  int index;

  VideoPlayScreen(this.index, {Key? key}) : super(key: key);

  @override
  _VideoPlayScreenState createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {

  late VideoPlayerController videoPlayerController;
  late ChewieController controller;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoPlayerController.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    videoPlayerController =
        VideoPlayerController.asset("${videoList[widget.index]["source"]}")
          ..initialize();
    ChewieController controller = ChewieController(
        aspectRatio: 16 / 9, videoPlayerController: videoPlayerController);

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Video Player",
          style: TextStyle(
            color: colorBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorWhite,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: colorWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 8,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: colorBlack,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Chewie(
                      controller: controller,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${videoList[widget.index]["title"]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${videoList[widget.index]["subtitle"]}",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
