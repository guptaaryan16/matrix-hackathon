import 'dart:async';

import 'package:flutter/material.dart';
import 'login_page.dart';

class OurSplashScreen extends StatefulWidget {
  const OurSplashScreen({super.key, required Text loadingText, required MaterialColor loaderColor, required double photoSize, required navigateAfterSeconds, required int seconds, required Image image, required Text title, required bool debugShowCheckedModeBanner});

  @override
  // ignore: no_logic_in_create_state
  State<OurSplashScreen> createState() => _OurSplashScreen();
}

class _OurSplashScreen extends State<OurSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => const LoginPage(),
          ));
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: const Center(
          child:Text("Matrix",
          style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          )
          ),
           ),
      ),
    );
  }
}
