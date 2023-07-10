import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/pages/welcomeScreen/GetStartProj.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/Welcome_to_our_app.mp3"));
  }

  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () {
        playSound();
         Future.delayed(Duration(seconds: 25), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return GetStartProject();
        },
      ));
    });
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
    return SafeArea(
        child: Scaffold(
            body: GestureDetector(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return GetStartProject();
        },
      ));
              },
              child: ListView(
                
                  children: [
                    Stack(
                      children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Background.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(110, 135, 0, 0),
                      child:  Text(
                        "Welcome TO\n PURE EYE",
                        style: TextStyle(
                            fontFamily: "Maitree",
                            fontSize: 26.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                 
                ],
              ),
               Positioned(
                bottom:185,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      "Our app is designed to help\n you get the most out of your\n phone's visual and audio\n capabilities. Here are some\n of the main features that\n you can expect from our\n app : Image caption, text\n-to-speech, image-to-speech\n, and customizable settings.           ",
                      style: TextStyle(
                        fontFamily: "ComicNeue",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color:Colors.green)),
                ),
              ),
               Positioned(
                    bottom: 25.h,
                    right: 2.w,
                    child: Image.asset(
                      "assets/images/Vector (1).png",
                      height: 180,
                     
                    ),
                  )
                      ],
                    ),
                  ],
                ),
            )));
  }
}
