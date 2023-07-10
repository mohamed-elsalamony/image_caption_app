import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:team_project_final/constant/colors.dart';

class Onbording3 extends StatefulWidget {
  const Onbording3({super.key});

  @override
  State<Onbording3> createState() => _Onbording3State();
}

class _Onbording3State extends State<Onbording3> {
  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/text_to_speech_description.mp3"));
  }

  @override
  void initState() {
   Timer(
      Duration(seconds: 2),
      () {
        playSound();
      },
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20.h,),
          Image.asset("assets/images/undraw_text_files_au1q 1.png"),
          SizedBox(height: 10.h,),
          Center(
            child: Text("Text To Speech",
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.SignColor)),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Text(
              " Convert any text or \n  pdf to audio",
              style: TextStyle(
                  fontSize: 30.sp,
                  fontFamily: "AkayaTelivigala",
                  fontWeight: FontWeight.w900,
                   color: Color(0xff424242)),
            ),
          ),
        ],
      ),
    );
  }
}
