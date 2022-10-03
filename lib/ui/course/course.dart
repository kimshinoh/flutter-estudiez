import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreen();
}

class _CourseScreen extends State<CourseScreen> {
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  late YoutubePlayerController _controller;
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "puDQTscHaIo",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
    @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/card.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topBar(),
                    _header(),
                    const SizedBox(height: 30),
                    _miniDivider(),
                    const SizedBox(height: 10),
                    _main(),
                    // const SizedBox(height: 20),
                    // _exam(),
                  ],
                ))));
  }

  Widget _miniDivider() {
    return Container(
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _main() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Course #51',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: double.infinity,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                setState(() {
                  _isPlayerReady = true;
                });
              },
             
            ),
          ),
        ],
      ),
    ));
  }

  Widget _header() {
    return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://i.stack.imgur.com/l60Hf.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nguyen Van A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "01325468975",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Class 6",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          ),
        ],
      ),
    );
  }
}
