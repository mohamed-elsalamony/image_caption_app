import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/pages/features/BottomNav.dart';
import 'package:team_project_final/pages/loginScreen/resetPassword.dart';
import 'package:team_project_final/pages/onbording/onbording2.dart';
import 'package:team_project_final/pages/welcomeScreen/signup.dart';
import '../../widgets/contianer.dart';
import '../../widgets/textfield.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LiginScreen extends StatefulWidget {
  const LiginScreen({super.key});

  @override
  State<LiginScreen> createState() => _LiginScreenState();
}

class _LiginScreenState extends State<LiginScreen> {
  bool checkBoxValue = true;
  bool visability = false;
  String? email;

  bool isLoadin = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    setState(() {
      isLoadin = true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in with email and password.'),
        ),
      );
    }
    setState(() {
      isLoadin = false;
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  String? password;
  Future<void> signIn() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoadin,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        maxLines: 6,
                        style: TextStyle(
                            fontSize: 30.sp,
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
                        color: Colors.black),
                  ),
                  Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(22),
                      child: TextFormFieldd(
                        controller: emailController,
                        onChanged: (data) {
                          password = data;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "process failed";
                          }
                          return null;
                        },
                        obscure: false,
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
                        controller: passwordController,
                        onChanged: (data) {
                          email = data;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "process failed";
                          }
                          return null;
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
                    height: 20.h,
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
                      const Text("Remember me")
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        signInWithEmailAndPassword(context);
                      },
                      child: ContainerWidget(
                        data: "Login",
                        hight: 60.h,
                        width: 350.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ResetPassword();
                          },
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
