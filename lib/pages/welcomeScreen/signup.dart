import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:team_project_final/logic/cubit/phoneAuth.dart';
import 'package:team_project_final/pages/features/BottomNav.dart';
import 'package:team_project_final/pages/loginScreen/login.dart';
import 'package:team_project_final/pages/loginScreen/register.dart';
import 'package:team_project_final/pages/onbording/onbording2.dart';

import '../../widgets/contianer.dart';
import '../loginScreen/login_phone.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PhoneAuthCubit? phoneAuthCubit;
  void _navigateToOtherScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationBBar()),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<User?> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        // Sign in with the credential
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Navigate to another screen on successful sign-in
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ),
        );

        return userCredential.user;
      } catch (e) {
        // Handle sign-in errors
        print("Failed to sign in with Google: $e");
      }
    }

    return null;
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //         if (facebookAuthCredential != null) {
  //     // The user is signed in
  //  setState(() {
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //       builder: (context) {
  //         return const BottomNavigationBBar();
  //       },
  //     ));
  //  });
  //   }

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
  Future loginFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final AccessToken? accessToken = result.accessToken;
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken!.token);

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // Registration successful, navigate to another screen
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return  OnboardingScreen();
          },
        ));
      } on FirebaseAuthException catch (e) {
        // Registration failed, show an error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
          duration: Duration(seconds: 3),
        ));
      }
    } else {
      // Handle the error
    }
  }

  @override
  void initState() {
    phoneAuthCubit = PhoneAuthCubit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Image.asset(
              "assets/images/under_pedestrian.png",
              height: 300.h,
            ),
            Text(
              "Helping visually impaired people",
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiginScreen(),
                  ),
                );
              },
              child: ContainerWidget(
                width: 300.w,
                hight: 48.h,
                data: "Login",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                              value: phoneAuthCubit!,
                              child: LoginScreen(),
                            )));
              },
              child: ContainerWidget(
                width: 300.w,
                hight: 48.h,
                data: "Sign In With Phone Number",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("dont have an account? "),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RigesterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      " SignUp ",
                      style: TextStyle(color: Colors.green, fontSize: 15.sp),
                    )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const Center(child: Text("or")),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () async {
                    await _signInWithGoogle();
                  },
                  child: ListTile(
                    title: Text("Google",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15.sp)),
                    leading: const Image(
                        image: AssetImage("assets/images/google.png")),
                  ),
                )),
                Expanded(
                    child: ListTile(
                  title: Text(
                    "Facebook",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),
                  ),
                  leading: SizedBox(
                      height: 40.h,
                      child: GestureDetector(
                        onTap: () async {
                          await loginFacebook();
                        },
                        child: const Image(
                            image: AssetImage(
                          "assets/images/facebook.jpg",
                        )),
                      )),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
