import 'package:flutter/material.dart';

class foodbutton extends StatefulWidget {
  final maincolor_d;
  final shadowcolor_d;
  final mediatodevide_w;
  final mediatodevide_h;
  final food_void;
  final text_v;
  final audio_v;
  final vly;

  const foodbutton(
      {Key key,
      @required this.maincolor_d = Colors.greenAccent,
      @required this.shadowcolor_d = Colors.greenAccent,
      this.mediatodevide_w = 10,
      this.mediatodevide_h = 10,
      this.food_void,
      this.text_v,
      this.audio_v, this.vly = true})
      : super(key: key);
  @override
  _foodbuttonState createState() => _foodbuttonState();
}

class _foodbuttonState extends State<foodbutton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.vly,
      child: InkWell(

        onTap: widget.food_void,
        child: Container(
          width: MediaQuery.of(context).size.width / widget.mediatodevide_w,
          height: MediaQuery.of(context).size.height / widget.mediatodevide_h,
          decoration: BoxDecoration(
            color: widget.maincolor_d,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: widget.shadowcolor_d,
                offset: Offset(0, 9),
                blurRadius: 20,
                spreadRadius: 0.8,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text_v,
              style: TextStyle(
                  fontFamily: 'ButtonFamily',
                  color: Color(0xB5000000),
                  fontSize: MediaQuery.of(context).size.height / 30),
            ),
          ),
        ),
      ),
    );
  }
}
