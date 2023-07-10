import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:image_picker/image_picker.dart';

import 'package:team_project_final/widgets/seet_cont.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File? image;
  final imagePicker = ImagePicker();

  pickedImageFromGallery() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {}
  }
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image == null
                      ? CircleAvatar(
                        radius: 80,
                        child: Text("No Image"),
                      )
                      : CircleAvatar(
                        radius: 80,
                        backgroundImage: Image.file(image!).image,
                      ),
                      GestureDetector(
                        onTap:pickedImageFromGallery ,
                        child: Icon(Icons.camera_alt),
                      )
                  
                ],
              ),
              SizedBox(height: 30,),
              SeeingContaioner(
                lead: const Icon(Icons.settings),
                title: const Text("Account Settings"),
                
              ),
              const SizedBox(height: 10),
              SeeingContaioner(
                lead: const Icon(Icons.privacy_tip),
                title: const Text("Privacy Policy"),
              ),
              const SizedBox(height: 10),
              SeeingContaioner(
                lead: const Icon(Icons.phone),
                title: const Text("Contact Us "),
              ),
              const SizedBox(height: 10),
              SeeingContaioner(
                lead: const Icon(Icons.signal_cellular_alt_1_bar_outlined),
                title: const Text("About"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child:  ListTile(onTap: ()async {
                   await signOut();
                },
                  leading: const Icon(Icons.logout,color: Colors.white,),
                  title: const Text("LogOut",style: TextStyle(color: Color.fromARGB(211, 255, 255, 255)),),
                ),
              )

            ],
          )),
    );
  }
}
