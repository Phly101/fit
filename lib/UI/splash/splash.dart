import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fitmeals/UI/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "Splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSplashScreen(
        duration: 3000,
        splash: SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            "assets/images/splash.png",
            fit: BoxFit.cover,
          ),
        ),
        nextScreen: const SignInScreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Colors.transparent,
        centered: true,
        splashIconSize: size.height,
      ),
    );
  }
}
