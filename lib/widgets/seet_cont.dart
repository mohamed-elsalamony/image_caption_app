import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SeeingContaioner  extends StatelessWidget {
   SeeingContaioner({super.key,required this.lead, required this.title});
Widget? title;
Widget? lead;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 320.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      
      child:ListTile(
        leading:lead ,
        title: title,
        
      ),
    );
  }
}