import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

playPrevSong() {
  print("Previous Song!");
  Fluttertoast.showToast(
    msg: "Previous Song",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

playNextSong() {
  print("Next Song!");
  Fluttertoast.showToast(
    msg: "Next Song",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

mediaPlayer() {
  var localAudio = AudioCache();
  var networkAudio = AudioPlayer();
  var controller = VideoPlayerController.asset('assets/sjlt.mp4');
  VideoPlayerController networkController = VideoPlayerController.network(
    'https://github.com/maitraibahuguna/Tune_IN/raw/master/assets/sjlt_vid.mp4',
  );
  controller.initialize();
  networkController.initialize();

  var playerBody = TabBarView(
    children: [
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 200,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                //color: Colors.grey,
                child: GestureDetector(
                  //splashColor: Colors.blue.withOpacity(0.3),
                  onTap: () {
                    print("Toggling Lyrics!");
                    Fluttertoast.showToast(
                      msg: "Lyrics",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: Image.asset('images/sjlt.jfif'),
                ),
                elevation: 10,
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  RangeSlider(values: RangeValues(0, 0), onChanged: null),
                  Row(
                    children: <Widget>[
                      Text("0:00"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.skip_previous),
                    onPressed: playPrevSong,
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      print("Playing!");
                      localAudio.play('sample.wav');
                    },
                  ),
                  IconButton(
                    iconSize: 50,
                    icon: Icon(Icons.skip_next),
                    onPressed: playNextSong,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Local Video",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 400,
              height: 200,
              color: Colors.grey,
              child: Card(
                child: VideoPlayer(controller),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Playing Video");
                      controller.play();
                    },
                    child: Icon(Icons.play_arrow),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Video Paused");
                      controller.pause();
                    },
                    child: Icon(Icons.pause),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Network Stream Audio",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 350,
              height: 80,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                //color: Colors.grey,
                child: Image.asset('images/images/sjlt.jfif'),
                elevation: 10,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Audio Playing!");
                        networkAudio.play(
                          'https://github.com/maitraibahuguna/Tune_IN/raw/master/assets/sjlt_aud.mp3',
                        );
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Audio Paused!");
                        networkAudio.pause();
                      },
                      child: Icon(Icons.pause),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Network Stream Video",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 300,
              height: 200,
              child: Card(
                child: VideoPlayer(networkController),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Video Playing!");
                        networkController.play();
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: FloatingActionButton(
                      onPressed: () {
                        print("Network Video Paused!");
                        networkController.pause();
                      },
                      child: Icon(Icons.pause),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );

  return MaterialApp(
    home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("Back Button Pressed");
              Fluttertoast.showToast(
                msg: "Back Button",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
          ),
          title: Text("Tune IN"),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print("Settings");
                Fluttertoast.showToast(
                  msg: "Settings",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.library_music),
              ),
              Tab(
                icon: Icon(Icons.video_library),
              ),
              Tab(
                icon: Icon(Icons.cloud_download),
              ),
            ],
          ),
        ),
        body: playerBody,
      ),
    ),
    debugShowCheckedModeBanner: false,
  );
}
