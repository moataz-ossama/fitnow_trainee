// @dart=2.9

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../../shared/project_colors/colors.dart';
class CountrySelect extends  StatefulWidget {
  const CountrySelect({Key key}) : super(key: key);


  @override

  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  VideoPlayerController vcontroller;

  @override
  void initState() {
    super.initState();
    vcontroller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')..addListener(() { })..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  void dispose(){
    vcontroller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container()  ,
        ),
      );
  }
}
/*
Container(
          color: ProjectColors.green_color,
          height: 400,
          width: double.infinity,
          child:  Scaffold(
            body: Center(
              child: vcontroller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: vcontroller.value.aspectRatio,
                child: VideoPlayer(vcontroller),
              )
                  : Container(),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ProjectColors.green_color,
              onPressed: () {
                setState(() {
                  vcontroller.value.isPlaying
                      ? vcontroller.pause()
                      : vcontroller.play();
                });
              },
              child: Icon(
                vcontroller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ),
        )
 */