import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_project_final/logic/cubit/phoneAuth.dart';



import 'package:team_project_final/pages/loginScreen/splashCreen.dart';

import 'constant/appRoutes.dart';

// vo
import 'package:firebase_auth/firebase_auth.dart';


import 'firebase_options.dart';

import 'pages/loginScreen/login_phone.dart';

late Widget initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = LoginScreen();
    } else {
      initialRoute = LoginScreen();
      // initialRoute = const BottomNavigationBBar();
    }
  });
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => PhoneAuthCubit(),
          child: MaterialApp(
              title: 'pure eye',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              // onGenerateRoute: appRouter.generateRoute,
              // initialRoute: initialRoute,
              home: SplashScreen()),
        );
      },
    );
  }
}
