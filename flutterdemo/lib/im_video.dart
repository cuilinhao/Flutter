import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
// import 'dart:async';

class FTIMVideoControl {
  FTIMVideoControl({this.url, this.presentFullScreen}) : super();
  final String url;

  Function presentFullScreen;
}

class FIIMVideoPlayerSimple extends StatefulWidget{
  FIIMVideoPlayerSimple({this.control}) : super();
  final control;
  @override
  State<StatefulWidget> createState() =>
      _FIIMVideoPlayerSimpleState(control: control);
}

// 保活，有点牛p
class _FIIMVideoPlayerSimpleState extends State<FIIMVideoPlayerSimple> with AutomaticKeepAliveClientMixin {
  _FIIMVideoPlayerSimpleState({this.control}) : super();

  final FTIMVideoControl control;

  VideoPlayerController vp;

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    // TODO: implement initState
    print("----------initState");

    if (vp == null){
      if (control.url.startsWith("http")) {
        vp = VideoPlayerController.network(control.url)..addListener(() {});
      } else {
        vp = VideoPlayerController.asset(control.url)..addListener(() {});
      }

          // vp.play();
      vp.setLooping(true);
      vp.initialize().then((_) {
        // print("initialize finish=====================");
        // print(vp);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    vp.dispose();
    print("----------dispose");
    super.dispose();
  }

  @override
    void deactivate() {
      // TODO: implement deactivate
      // vp.dispose();
      print("----------deactivate");
      super.deactivate();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (vp.value.initialized && vp.value.isPlaying)
        ? AspectRatio(
            aspectRatio: vp.value.aspectRatio,
            child: new GestureDetector(
                onTap: () {
                  if (vp.value.isPlaying) {
                    vp.pause();
                  } else {
                    vp.play();
                  }
                },
                onDoubleTap: () {
                  vp.pause();
                  control.presentFullScreen();
                },
                child: VideoPlayer(vp)),
          )
        : GestureDetector(
            onTap: () {
              if (vp.value.initialized) {
                vp.play();
                setState(() {});
              } else {
                print("还在缓冲...");
              }
            },
            child: new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.network(
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3874676548,29357861&fm=11&gp=0.jpg"),
                Image.asset("assets/im_player.png")
              ],
            ),
          );
  }
}
