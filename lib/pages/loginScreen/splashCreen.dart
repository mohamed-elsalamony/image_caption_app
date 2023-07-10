import 'package:flutter/material.dart';
import 'package:team_project_final/constant/colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:team_project_final/pages/welcomeScreen/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WelcomeScreen();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body:
       GestureDetector(
        onTap: () {
            Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return WelcomeScreen();
        },
      ));
        },
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeftBig(
               duration: Duration(seconds: 2),
                child: Center(child: Image.asset("assets/images/Group 186.png"))),
            const SizedBox(
              height: 10,
            ),
            FadeInRightBig(
              duration: Duration(seconds: 2),
                child: Text(
              "PURE EYE",
              style: TextStyle(
                  fontFamily: "Maitree",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.SignColor),
            ))
          ],
             ),
       ),
    ));
  }
}
