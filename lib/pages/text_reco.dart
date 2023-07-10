import 'dart:io';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../details_text_recogine.dart';




class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text = '';
  late PickedFile _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Text Recognition'),
          actions: [
            ElevatedButton(
              onPressed: scanText,
              child: Text(
                'Scan',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          child: Icon(Icons.add_a_photo),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: _image != null
              ? Image.file(
                  File(_image.path),
                  fit: BoxFit.fitWidth,
                )
              : Container(),
        ));
  }

  Future scanText() async {
    showDialog(
      builder: (context) {
        return  Center(
          child: CircularProgressIndicator(),
        );
      },
        context: context,
        
        );
    // final FirebaseVisionImage visionImage =
    //     FirebaseVisionImage.fromFile(File(_image.path));
    // final TextRecognizer textRecognizer =
    //     FirebaseVision.instance.textRecognizer();
    // final VisionText visionText =
    //     await textRecognizer.processImage(visionImage);

    // for (TextBlock block in visionText.blocks) {
    //   for (TextLine line in block.lines) {
    //     // _text += line.text + '\n';
    //   }
    // }

    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Details(_text)));
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        // _image = pickedFile;
      } else {
        print('No image selected');
      }
    });
  }
}
// import 'dart:io';

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:team_project_final/models/caption.dart';
// import 'package:team_project_final/services/image_speeech.dart';

// class ShowImageFromCaption extends StatefulWidget {
//   final File? selectImage;

//   ShowImageFromCaption({Key? key, required this.selectImage}) : super(key: key);

//   @override
//   _ShowImageFromCaptionState createState() => _ShowImageFromCaptionState();
// }

// class _ShowImageFromCaptionState extends State<ShowImageFromCaption> {
//   final TextEditingController _controller = TextEditingController();
//   late Future<ImageCaption> _captionFuture;

//   @override
//   void initState() {
//     super.initState();

//     // Call imageCaption() method with the selected image file
//     _captionFuture = CaptionImageServices().imageCaption(caption: widget.selectImage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 300.h,
//                 width: 350.w,
//                 child: Image.file(widget.selectImage),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               FutureBuilder<ImageCaption>(
//                 future: _captionFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     // Set text of the TextEditingController with the generated caption
//                     _controller.text = snapshot.data!.caption;

//                     return Padding(
//                       padding: const EdgeInsets.only(right: 10, left: 10),
//                       child: TextField(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25),
//                             borderSide: BorderSide(color: Colors.green),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(25),
//                             borderSide: BorderSide(color: Colors.green),
//                           ),
//                           hintText: "Listen to Caption",
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.green),
//                           ),
//                         ),
//                       ),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text("Error: ${snapshot.error}");
//                   } else {
//                     return CircularProgressIndicator();
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }