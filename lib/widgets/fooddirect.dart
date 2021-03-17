import 'package:flutter/material.dart';
import 'package:mkke/widgets/foodwidget.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';

class directtopagewidget extends StatefulWidget {
  final backcolor_d;
  final s_backcolor_d;
  final top;
  final bottom;
  final topvoid;
  final bottomvoid;
  final image;
  final somewhat;
  final sbl;

  const directtopagewidget(
      {Key key,
        @required this.backcolor_d,
        @required this.s_backcolor_d,
        @required this.top,
        @required this.bottom,
        @required this.topvoid,
        @required this.bottomvoid,
        this.image,
        this.somewhat, this.sbl})
      : super(key: key);
  @override
  _directtopagewidgetState createState() => _directtopagewidgetState();
}

class _directtopagewidgetState extends State<directtopagewidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [widget.backcolor_d, widget.s_backcolor_d])),
      child: Stack(
        children: [

          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 1.05),

            ],
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage(
                      image: NetworkImage(
                        widget.image,
                      ),
                      height: 150.0,
                      fit: BoxFit.fill,
                      width: 100.0,
                      placeholder: AssetImage('assets/ohno.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 19),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,

                decoration: BoxDecoration(color: Colors.black38,
                borderRadius: BorderRadius.circular(9)),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    widget.somewhat,
                    style: TextStyle(fontFamily: 'ButtonFamily', fontSize: 90,
                    color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              foodbutton(
                maincolor_d: Color(0xffFFE1E1),
                shadowcolor_d: Color(0xffFF0000),
                mediatodevide_w: 3,
                mediatodevide_h: 15,
                food_void: widget.topvoid,
                text_v: widget.top,
                vly: widget.sbl ,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              foodbutton(
                maincolor_d: Color(0xffCCFACF),
                shadowcolor_d: Color(0xff00FF93),
                mediatodevide_w: 2,
                food_void: widget.bottomvoid,
                text_v: widget.bottom,

              ),

            ],
          ),
        ],
      ),
    );
  }
}
