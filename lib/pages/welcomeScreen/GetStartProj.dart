import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/constant/colors.dart';
import 'package:team_project_final/pages/welcomeScreen/signup.dart';

class GetStartProject extends StatefulWidget {
  const GetStartProject({super.key});

  @override
  State<GetStartProject> createState() => _GetStartProjectState();
}

class _GetStartProjectState extends State<GetStartProject> {
  late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/get_started.mp3"));
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
        backgroundColor: const Color(0xff1BAC4B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              "assets/images/Group.png",
              height: 280.h,
            ),
            SizedBox(
              height: 22.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 10.w),
              child: Text(
                "Thank you for choosing\n our app, we hope it helps you get the most out of it and helps you describe the world well.",
                style: TextStyle(
                    color: Colors.white, fontSize: 24.sp, fontFamily: "fresca"),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ));
              },
              child: Container(
                width: 350.w,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  " Get Started",
                  style: TextStyle(
                      color: AppColors.SignColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
