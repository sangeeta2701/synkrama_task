import 'package:flutter/material.dart';
import 'package:synkrama_task/Screens/signin_screen.dart';
import 'package:synkrama_task/utils/colors.dart';
import 'package:synkrama_task/utils/pallate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Colors.black,
       primarySwatch: Palette.kToDark
      ),
      home: SigninScreen()
    );
  }
}

