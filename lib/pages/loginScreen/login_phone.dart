import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:team_project_final/logic/cubit/phoneAuth.dart';
import 'package:team_project_final/pages/loginScreen/otp.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  String phoneNumber = "";

   bool checkBoxValue = false;

  Widget _buildIntroTexts() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4)),
                margin: const EdgeInsets.all(0),
                height: 30.h,
                width: 30.w,
                child: const Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30.h,),
          const Center(
            child: Text(
              'Sign Up with your \n phone number',
              style: TextStyle(
                  color: Color(0xff4B4B4B), fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            child:  Text(
              "Phone number : ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(
              generateCountryFlag() + ' +20',
              style: TextStyle(fontSize: 18, letterSpacing: 2.0),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: TextFormField(
              // autofocus: true,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
              decoration: InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter yout phone number!';
                } else if (value.length < 11) {
                  return 'Too short for a phone number!';
                }
                return null;
              },
              onChanged: (value) {
                phoneNumber = value;
                print(value);
              },
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  Future<void> _register(BuildContext context) async {
    if (!_phoneFormKey.currentState!.validate()) {
      // Navigator.pop(context);
    } else {
      // Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  Widget _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);

          _register(context);
        },
        child: Text(
          'Send Code',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(330.w, 50.h),
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: const Color.fromARGB(255, 212, 160, 160).withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }

        if (state is PhoneNumberSubmited) {
          Navigator.pop(context);
          // Navigator.of(context).pushNamed(otpScreen, arguments: phoneNumber);
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return OtpScreen(phoneNumber: phoneNumber);
          }));
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _phoneFormKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroTexts(),
                  SizedBox(
                    height: 8,
                  ),
                  _buildPhoneFormField(),
                  SizedBox(
                    height: 30,
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
                  Text("Remmber me")
                    ],
                  ),
                   SizedBox(
                    height: 30,
                  ),
                      
                  _buildNextButton(context),
              
                  _buildPhoneNumberSubmitedBloc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
