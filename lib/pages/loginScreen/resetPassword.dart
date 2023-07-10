import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/pages/loginScreen/register.dart';
import 'package:team_project_final/widgets/contianer.dart';

import 'package:team_project_final/widgets/textfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4)),
                    margin: EdgeInsets.all(15),
                    height: 30.h,
                    width: 30.w,
                    child: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(
                      "assets/images/undraw_my_password_re_ydq7 1 (1).png"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Forget\n Password?",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Card(
                      child: TextFormFieldd(
                    hintTextt: "Enter Email",
                    obscure: false,
                  )),
                  SizedBox(
                    height: 25.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return RigesterScreen();
                          },
                        ));
                      },
                      child: ContainerWidget(
                        data: "Send Code",
                        hight: 40.h,
                        color: Colors.green,
                        width: 330.w,
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
