import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'dashboard.dart';




class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face_rounded,color: Colors.white,size: 50,),
            SizedBox(width: 10,),
            Center(child: Text('WELCOME',style: TextStyle(
                color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
            ),)),
          ],
        ),
        nextScreen: Dashboared(),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.purple.shade400);
  }
}