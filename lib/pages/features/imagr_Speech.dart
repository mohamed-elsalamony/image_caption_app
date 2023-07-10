import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';
import 'package:team_project_final/pages/features/recognization.dart';

import '../../Utlis/image_correr.dart';
import '../../Utlis/image_packer.dart';


class Image_Speech extends StatefulWidget {
  const Image_Speech({super.key});

  @override
  State<Image_Speech> createState() => _Image_SpeechState();
}

class _Image_SpeechState extends State<Image_Speech> {

  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/image_to_speech_describe.mp3"));
  }

  @override
  void initState() {
    playSound();
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
            backgroundColor: Colors.green,
            body: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                  
                      log("Gallery");
                      pickImage(source: ImageSource.gallery).then((value) {
                        if (value != '') {
                          imageCropperView(value, context).then((value) {
                            if (value != '') {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => RecognizePage(
                                    path: value,
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      });
                    
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      ),
                      Image.asset(
                        "assets/images/Vector (2).png",
                        height: 200.h,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                   
                      log("Camera");
                      pickImage(source: ImageSource.camera).then((value) {
                        if (value != '') {
                          imageCropperView(value, context).then((value) {
                            if (value != '') {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => RecognizePage(
                                    path: value,
                                  ),
                                ),
                              );
                            }
                          });
                        }
                      });
                    
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      ),
                      Image.asset(
                        "assets/images/Vector (3).png",
                        height: 200.h,
                      )
                      //   SizedBox(height: 10.h,),
                    ],
                  ),
                ),
               
              ],
            )));
  }
}
