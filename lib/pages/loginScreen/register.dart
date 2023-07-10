import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:team_project_final/pages/loginScreen/login.dart';
import 'package:team_project_final/pages/welcomeScreen/signup.dart';

import '../../widgets/contianer.dart';
import '../../widgets/textfield.dart';

class RigesterScreen extends StatefulWidget {
  const RigesterScreen({super.key});

  @override
  State<RigesterScreen> createState() => _RigesterScreenState();
}

class _RigesterScreenState extends State<RigesterScreen> {
  bool checkBoxValue = true;
  bool visability = false;
  bool isLoadin = false;

  registerUser() async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  String? email;

  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoadin,
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4)),
                      margin: const EdgeInsets.all(15),
                      height: 30.h,
                      width: 30.w,
                      child: const Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Create New \n   Account",
                        maxLines: 6,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "  Your Email :",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(150, 0, 0, 0)),
                  ),
                  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(22),
                      child: TextFormFieldd(
                        obscure: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "process failed";
                          }
                        },
                        onChanged: (data) {
                          email = data;
                        },
                        // suffixIcoon:Icon(Icons.email),
                        hintTextt: "Email",
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "  Password :",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(22),
                      child: TextFormFieldd(
                        onChanged: (data) {
                          password = data;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "process failed";
                          }
                        },
                        obscure: !visability,
                        suffixIcoon: IconButton(
                          onPressed: () {
                            visability = !visability;
                            setState(() {});
                          },
                          icon: visability
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.green,
                                )
                              : const Icon(Icons.visibility_off),
                          color: Colors.green,
                        ),
                        hintTextt: "  Password",
                      )),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          checkBoxValue = value!;
                          setState(() {});
                        },
                      ),
                      Text.rich(TextSpan(
                          text: 'I agree to the ',
                          style: TextStyle(fontSize: 10.sp),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Terms & conidition',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 26, 191, 31),
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '\nand  ',
                            ),
                            TextSpan(
                              text: " privacy policy",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 26, 191, 31),
                                  fontWeight: FontWeight.bold),
                            )
                          ])),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoadin = true;
                        CircularProgressIndicator();
                      });
                      if (formKey.currentState!.validate()) {
                        try {
                          await registerUser();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(
                                context, "The password provided is too weak");
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context,
                                "The account already exists for that email");
                          }
                        }
                        setState(() {
                          isLoadin = false;
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return LiginScreen();
                          },
                        ));
                      } else {
                        // Validation failed
                      }
                    },
                    child: ContainerWidget(
                      data: "Creat Account",
                      hight: 60.h,
                      width: 250.sp,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text.rich(TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 26, 191, 31),
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
