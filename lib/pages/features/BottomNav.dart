import 'package:flutter/material.dart';

import 'package:team_project_final/constant/colors.dart';
import 'package:team_project_final/pages/features/setting.dart';

import 'image_Caption.dart';
import 'imagr_Speech.dart';
import 'text_speech.dart';

class BottomNavigationBBar extends StatefulWidget {
  const BottomNavigationBBar({super.key});

  @override
  State<BottomNavigationBBar> createState() => _BottomNavigationBBarState();
}

class _BottomNavigationBBarState extends State<BottomNavigationBBar> {
  int currentIndex = 0;
  List contains = [
       const TextSpeech(),
         ImageCaptioning(),
    const Image_Speech(),
  
    
 
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        body: contains[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: AppColors.SignColor,
            unselectedItemColor: const Color(0xff4B4B4B),
            // selectedLabelStyle: TextStyle(color: Color(0xff4B4B4B)),
            unselectedLabelStyle: const TextStyle(color: Color(0xff4B4B4B)),
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
               BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage("assets/images/Frame 7.png"),
                  size: 80,
                ),
              ),
                BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage("assets/images/Frame 5.png"),
                  size: 104,
                ),
              ),
                BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage("assets/images/Frame 6.png"),
                  size: 80,
                ),
              ),
            
            
             
              BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage("assets/images/Frame 8.png"),
                  size: 80,
                ),
              ),
            ]),
      ),
   
    );
  }
}
