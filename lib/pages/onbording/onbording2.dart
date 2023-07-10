import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../features/BottomNav.dart';
import 'newOnbording.dart';
import 'newOnbrding2.dart';
import 'newonBording1.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController..nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  late final AudioPlayer player;
  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
      // if(currentIndex==0){
      //     player.play(
      //   AssetSource("assets/sounds/mp3.mp3"));
      // }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PageView(
              controller: _pageController,
              onPageChanged: onChangedFunction,
              children: const <Widget>[
                Onbording3(),
                Onboarding1(),
                Onbording2(),
                
                BottomNavigationBBar()
              ],
            ),
            Positioned(
              bottom: 60,
              left: 150,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Indicator(
                    positionIndex: 0,
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 2,
                    currentIndex: currentIndex,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
            ),
            // Positioned(
            //   bottom: 30,
            //   left: 130,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //     child: Container(
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           // InkWell(
            //           //     onTap: () => previousFunction(),
            //           //     child: Text("Previous")),
            //           SizedBox(
            //             width: 50,
            //           ),
            //           InkWell(
            //               onTap: () {
            //                 Navigator.pushReplacement(context, MaterialPageRoute(
            //                   builder: (context) {
            //                     return BottomNavigationBBar();
            //                   },
            //                 ));
            //               },
            //               child: const Text(
            //                 "Next",
            //                 style: TextStyle(fontSize: 25),
            //               ))
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  Indicator(
      {super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 236, 252, 236)),
          color:
              positionIndex == currentIndex ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
