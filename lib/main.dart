import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String videoURL = "https://www.youtube.com/watch?v=Bkqp_pbHJLI";
  String liveVideoURL = "https://www.youtube.com/watch?v=5qap5aO4i9A";

  YoutubePlayerController _controller;
  YoutubePlayerController _liveVideoController;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL),
    );

    _liveVideoController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(liveVideoURL),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube Player"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(13.0),
            child: Column(
              children: <Widget>[
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                SizedBox(
                  height: 20,
                ),
                YoutubePlayer(
                  controller: _liveVideoController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
