import 'package:fitmeals/UI/auth/sign_in.dart';
import 'package:fitmeals/UI/auth/sign_up.dart';
import 'package:fitmeals/UI/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fit Meals',
      routes: {

        SplashScreen.routeName: (_) => SplashScreen(),
        SignInScreen.routeName: (_) => SignInScreen(),
        SignUpScreen.routeName: (_) => SignUpScreen(),

      },
      home: SplashScreen(),
    );
  }
}
