import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mkke/widgets/fooddirect.dart';
import 'dart:async';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:typed_data';


class foodpage extends StatefulWidget {
  @override
  _foodpageState createState() => _foodpageState();
}

class _foodpageState extends State<foodpage> {
  int food = 0;
  String sod = 'Start!';
  bool onoffcolor = true;
  String letsee = "Swipe up for Settings";

  final List<String> assetsound = <String>[
    'assets/LETSGETCOOKING.wav',
    'assets/fries.wav',
    'assets/Noodles.wav',
    'assets/rice.wav',
    'assets/sjuice.wav',
    'assets/spaghetti.wav'
  ];

  @override
  Widget build(BuildContext context) {
    final player1 = AudioPlayer();
    var shortestSide = MediaQuery.of(context).size.shortestSide;


    final List<Color> tcolor = <Color>[
      Colors.blue,
      Colors.orange,
      Colors.yellow,
      Colors.white,
      Colors.orange,
      Colors.redAccent
    ];
    final List<Color> bcolor = <Color>[
      Colors.green,
      Colors.deepOrange,
      Colors.orange,
      Colors.brown,
      Colors.red,
      Colors.orangeAccent
    ];

    final List<String> iimages = <String>[
      'https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/69616/hand-washing-clipart-md.png',
      'https://sites.google.com/site/frenchfries1151105330/_/rsrc/1486562943826/types-of-french-fries/regular%20fries.png?height=296&width=320',
      'https://teriyakimadness.com/wp-content/uploads/2020/02/TMAD_Noodles.png',
      'https://cdn.thrivelife.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/r/i/rice_instantwhite-pc_productcan.png',
      'https://images.vexels.com/media/users/3/227767/isolated/preview/0bda0e109a72778e032f079bf9c2066a-strawberry-juice-realistic-design-by-vexels.png',
      'https://static.wikia.nocookie.net/supermarioglitchy4/images/5/5c/Spaghetti_bowl.png/revision/latest/top-crop/width/300/height/300?cb=20200607060429'
    ];

    final List<String> whatshouldI = <String>[
      'Get Ready!',
      'Make some Fries!',
      'Make some Noodles!',
      'Make some Rice!',
      'Make some Strawberry Juice!',
      'Make some Spaghetti!'
    ];

    void seethis() {
      setState(() {
        letsee = "Swipe up for Settings";
      });
    }

    void nowseethis() {
      setState(() {
        letsee = "Swipe Down To Close";
      });
    }

    void reallyseethis() {
      setState(() {
        letsee = "";
      });
    }

    void onoffpress() {
      if (onoffcolor == true)
        setState(() {
          onoffcolor = false;
          print('false');
        });
      else
        setState(() {
          onoffcolor = true;
          print('true');
        });
    }

    Future<void> playy() async {
      print('$food');
      await player1.setAsset(assetsound[food]);
      await player1.play();
      print('done');
      print('$food and ${assetsound.length}');
      player1.dispose();
    }

    void settingsplay() {
      if (onoffcolor == true)
        playy();
      else
        print('VOICE OFF');
    }

    void addone() {
      if (food == assetsound.length - 1)
        setState(() {
          food = 0;
        });
      else
        setState(() {
          food++;
        });
    }

    void checkifdone() {
      setState(() {
        sod = 'Wait';
      });
      if (food < 1)
        setState(() {
          sod = 'Start!';
        });
      else
        sod = 'Done!';
    }

    ;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            directtopagewidget(
                sbl: onoffcolor,
                backcolor_d: tcolor[food],
                s_backcolor_d: bcolor[food],
                top: 'Repeat',
                bottom: '$sod',
                topvoid: () {
                  settingsplay();
                },
                bottomvoid: () async {
                  await addone();
                  checkifdone();
                  settingsplay();
                },
                image: iimages[food],
                somewhat: whatshouldI[food]),
            SlidingUpPanel(
              maxHeight: MediaQuery.of(context).size.height / 1.3,
              backdropColor: Color(0x00FFFFFF),
              onPanelOpened: () {
                nowseethis();
              },
              onPanelClosed: () {
                seethis();
              },
              color: Color(0x00FFFFFF),
              panel: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  Stack(
                    children: [

                      Column(
                        children: [Container(
                          child: SelectableText(
                            '$letsee',
                            style: TextStyle(
                                fontFamily: 'ButtonFamily', color: Colors.white,
                            fontSize: 25),
                          ),
                        ),

                          ],

                      ),


                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 9,),
                  ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 20,
                        color: Colors.black87,
                        child: Column(
                          children: [
                            Center(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: SelectableText(
                                        'Voice On/Off',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'ButtonFamily'),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        onoffpress();
                                      },
                                      child: FittedBox(
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width / 9.25,
                                              0,
                                              0,
                                              0),
                                          width: MediaQuery.of(context).size.width / 20,
                                          height: MediaQuery.of(context).size.height / 20,
                                          decoration: BoxDecoration(
                                              color: onoffcolor == true
                                                  ? Colors.greenAccent
                                                  : Colors.redAccent,
                                              shape: BoxShape.circle),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 9,),
                      shortestSide < 600 ? Container(
                        child: SelectableText(
                          'Your Device Might not be a Tablet (Which is what this app is originally meant for), Currently, Images look the best there. Phone development is still being worked on.',
                          style: TextStyle(color: Colors.red, fontSize: 10),

                        ),
                      ) : Container(
                        child: SelectableText(
                          '',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],

                  )
                ],
              ),
            ),
            SafeArea(
              child: Visibility(
                visible: false,
                child: Column(
                  children: [
                    Container(
                      child: SelectableText(
                        'App Version: 0.50',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    Container(
                      child: FittedBox(
                        child: SelectableText(
                          'Voices Made with https://vo.codes/',
                          style: TextStyle(
                              fontFamily: 'ButtonFamily',
                              color: Colors.white,
                              fontSize: 6),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
