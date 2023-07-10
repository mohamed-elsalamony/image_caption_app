import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.data,
    required this.width,
    required this.hight,
    this.color

  });
  String? data;
  double? width;
  double? hight;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: hight,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Text(
        data!,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
