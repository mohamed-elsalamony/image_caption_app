import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_project_final/pages/features/BottomNav.dart';

import 'package:team_project_final/pages/loginScreen/otp.dart';

import 'strings.dart';
import '../logic/cubit/phoneAuth.dart';
import '../pages/loginScreen/login_phone.dart';


class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case bottomNavBar:
        return MaterialPageRoute(
           builder: (context)=> BottomNavigationBBar(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
    }
    return null;
  }
}