import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/constant/colors.dart';

class Onbording2 extends StatefulWidget {
  const Onbording2({super.key});

  @override
  State<Onbording2> createState() => _Onbording2State();
}

class _Onbording2State extends State<Onbording2> {
  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/image_to_speech_description.mp3"));
  }

  @override
  void initState() {
    final timer = Timer(
      const Duration(seconds: 2),
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
           SizedBox(
            height: 12.h,
          ),
          Image.asset("assets/images/undraw_image_focus_re_qqxc 1 (1).png"),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Image To Speech",
                style: TextStyle(
                    fontSize: 27.h,
                    fontWeight: FontWeight.bold,
                    color: AppColors.SignColor)),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "  Take a picture with your \n camera to convert any word\n  in this picture into audio\n or click on the screen to re-describe the feature or swipe on the screen if you want the\n          next feature",
              style: TextStyle(
                  fontFamily: "AkayaTelivigala",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff424242)),
            ),
          ),
        ],
      ),
    );
  }
}
