import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:team_project_final/models/caption.dart';

import 'package:team_project_final/services/image_speeech.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ShowImageFromCaption extends StatefulWidget {
  final File? selectImage;

  ShowImageFromCaption({Key? key, required this.selectImage}) : super(key: key);

  @override
  _ShowImageFromCaptionState createState() => _ShowImageFromCaptionState();
}

class _ShowImageFromCaptionState extends State<ShowImageFromCaption> {
  final TextEditingController _controller = TextEditingController();
  late Future<ImageCaption> _captionFuture;

  @override
  void initState() {
    super.initState();

    // Call imageCaption() method with the selected image file
    _captionFuture =
        CaptionImageServices.imageCaption(caption: widget.selectImage!);
  }

  final FlutterTts flutterTts = FlutterTts();
  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300.h,
                width: 350.w,
                child: Image.file(widget.selectImage!),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<ImageCaption>(
                future: _captionFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Set text of the TextEditingController with the generated caption
                    _controller.text = snapshot.data!.caption!;
                    speak(_controller.text);

                    return Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.green),
                          ),
                          hintText: "Listen to Caption",
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
