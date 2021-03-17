import 'package:flutter/material.dart';
import 'package:mkke/pages/foodpage.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(StartApp());

class jj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartApp(),

    );
  }
}


class StartApp extends StatefulWidget {

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  final player1 = AudioPlayer();

  int food = 0;

  Future<void> playy() async {
    await player1.setAsset('assets/LETSGETCOOKING.wav');
    await player1.play();
    print('sport');
    player1.dispose();

  }

  void initState() {
    super.initState();
    playy();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black12));

    return MaterialApp(
      home: foodpage(),
    );
  }
}


