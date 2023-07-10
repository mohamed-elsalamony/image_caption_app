import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_tts/flutter_tts.dart';

class TextSpeech extends StatefulWidget {
  const TextSpeech({super.key});

  @override
  State<TextSpeech> createState() => _TextSpeechState();
}

class _TextSpeechState extends State<TextSpeech> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();
  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  TextEditingController controller = TextEditingController();
    late AudioPlayer player;
  void playSound() async {
    player = AudioPlayer();
    await player.play(AssetSource("sounds/text_to_speech_description.mp3"));
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
      flutterTts.stop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                minLines: 1,
                maxLines: MediaQuery.of(context).size.height.toInt(),
                controller: controller,
                decoration: const InputDecoration(
                    hintText: "write your sentence here...",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    focusColor: Colors.green,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                speak(controller.text);
                // controller.clear();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text(
                  "convert Text To Speech",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                )),
                height: 50.h,
                width: 330.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
