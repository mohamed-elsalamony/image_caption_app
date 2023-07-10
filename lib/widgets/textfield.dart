import 'package:flutter/src/widgets/framework.dart';


import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldd extends StatelessWidget {
  TextFormFieldd(
      {super.key,
      this.hintTextt,
      this.onChanged,
      this.validator,
      required this.obscure,
       this.suffixIcoon, 
       this.controller
       });
  String? hintTextt;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  bool obscure = false;
  Widget? suffixIcoon;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcoon,
        border: InputBorder.none,
        hintText: hintTextt,
        // label: Text("Your Email"),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
