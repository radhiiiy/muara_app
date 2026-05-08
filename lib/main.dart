import 'package:flutter/material.dart';
import 'package:muara_app/screens/splash_screen.dart';

void main() {
  runApp(const MuaraApp());
}

class MuaraApp extends StatelessWidget {
  const MuaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MUARA',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      ),
      home:SplashScreen(),
    );
  }
}