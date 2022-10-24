import 'package:flutter/material.dart';

// import 'login.dart';
import 'grading.dart';
import 'login.dart';
import 'schedule.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        primaryColor: const Color(0xFF2661FA),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
