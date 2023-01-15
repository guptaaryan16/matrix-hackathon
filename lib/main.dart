// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'audio.dart';
import 'login_page.dart';
import 'splash_screen.dart';
import 'routes.dart';
import 'dart:convert';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme : ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      
    );
    */
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes:{
        MyRoutes.homeRoute : (context)=>const MyAudioApp(),
        MyRoutes.loginRoute : (context)=>const LoginPage()
      }
    );
  }
}