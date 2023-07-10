import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_project_final/pages/features/img_cap_final.dart';

import 'package:team_project_final/widgets/contianer.dart';

class ImageCaptioning extends StatefulWidget {
  ImageCaptioning({
    super.key,
  });

  @override
  State<ImageCaptioning> createState() => _ImageCaptioningState();
}

class _ImageCaptioningState extends State<ImageCaptioning> {
  late File image;
  final imagePicker = ImagePicker();
  late File name;

  uploadImageee() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
        name = File(pickedImage.name);
      });
    } else {}
  }

  pickedImageFromGallery() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
    
      setState(() {
        image = File(pickedImage.path);
        name = File(pickedImage.name);
      });
    } else {}
  }

  void showModelBottomSheeet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          color: Colors.white,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await pickedImageFromGallery();
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return ShowImageFromCaption(
                        selectImage: image,
                      );
                    },
                  ));
                },
                child: ContainerWidget(
                  data: "Galeery",
                  hight: 150,
                  width: 300,
                ),
              ),
              GestureDetector(
                onTap: () async {
               
                },
                child: ContainerWidget(
                  data: "Camera",
                  hight: 150,
                  width: 300,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/image_captioning_screen.mp3"));
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
            body: Column(
      children: [
        InkWell(
          child: Image.asset(
            "assets/images/cameraicondribbble 1.png",
            height: 560,
            width: double.infinity,
          ),
          onTap: () async{
             await uploadImageee();
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ShowImageFromCaption(selectImage: image);
                    },
                  ));
          },
        )
      ],
    )));
  }
}
