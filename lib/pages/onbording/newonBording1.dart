import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/constant/colors.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/image_captioning_description.mp3"));
  }

  @override
  void initState() {
    Timer(
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
          Image.asset("assets/images/undraw_camera_re_cnp4 1.png"),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              "Image Captioning",
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.SignColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "  Take a picture with your\n camera to describe it with a voice message or click on  the screen to re-describe the feature or swipe on the screen if you want the next\n              feature",
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "AkayaTelivigala",
                  color: Color(0xff424242)
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
