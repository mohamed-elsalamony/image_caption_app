import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: 
      Center(child: Image.asset("assets/images/splash_screen.jpg"))
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Center(
      //       child: (
      //          Container(
      //           // margin: EdgeInsets.all(80),
      //           child:  Center(
      //               child: Text(
      //             "LoGo",
      //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      //           )),
      //           color: Colors.grey,
      //           width: 248,
      //           height: 193,
      //         )
      //       ),
      //     ),
      //     Image.asset("assets/images/progress.png")
      //   ],
      // ),
   
    ));
  }
}
