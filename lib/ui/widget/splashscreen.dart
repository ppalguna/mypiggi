import 'dart:async';
import 'package:flutter/material.dart';

import 'package:my_piggy_app/ui/home_page.dart';
import 'package:my_piggy_app/ui/theme.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 4),(){
      Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_)=>  HomePage()));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: primaryClr,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
         
            Image.asset(
              'images/logosp.png',
              height: 300,
            ),
            
            // const CircularProgressIndicator.adaptive(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // )
          ],
        ),
      ),
    );
  }
}