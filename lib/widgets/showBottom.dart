// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:team_project_final/pages/features/img_cap_final.dart';
// import 'package:team_project_final/widgets/contianer.dart';
// class imageCaptionnnnn extends StatefulWidget {
//   const imageCaptionnnnn({super.key});

//   @override
//   State<imageCaptionnnnn> createState() => _imageCaptionnnnnState();
// }

// class _imageCaptionnnnnState extends State<imageCaptionnnnn> {
//   File? image;
// final imagePicker = ImagePicker();
// late Function listen;
// uploadImage() async {
//   var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
//   if (pickedImage != null) {
//    setState(() {
//       image = File(pickedImage.path);
//    });
//   } else {}
// }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// VoidCallback? updateUi;
// File? image;
// final imagePicker = ImagePicker();
// late Function listen;
// uploadImage() async {
//   var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
//   if (pickedImage != null) {
//     image = File(pickedImage.path);
//   } else {}
// }

// pickedImageFromGallery() async {
//   var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
//   if (pickedImage != null) {
//     image = File(pickedImage.path);
//   } else {}
// }

// void showModelBottomSheeet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return Container(
//         height: 500,
//         color: Colors.white,
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 pickedImageFromGallery();
//                 Navigator.pushReplacement(context, MaterialPageRoute(
//                   builder: (context) {
//                     return ShowImageFromCaption(selectImage: image);
//                   },
//                 ));
//               },
//               child: ContainerWidget(
//                 data: "Galeery",
//                 hight: 150,
//                 width: 300,
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 uploadImage();
//                 Navigator.pushReplacement(context, MaterialPageRoute(
//                   builder: (context) {
//                     return ShowImageFromCaption(selectImage: image);
//                   },
//                 ));
//               },
//               child: ContainerWidget(
//                 data: "Camera",
//                 hight: 150,
//                 width: 300,
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
