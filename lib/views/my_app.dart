import 'package:flutter/material.dart';

import '/themes/light.dart';
import 'auth/login_view.dart';
import 'auth/signup_view.dart';
import 'menu_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ktdLight,
      initialRoute: "login",
      routes: {
        "login": (context) => const LoginView(),
        "register": (context) => const SignupView(),
        "menu": ((context) => const Menu(2))
      },
    );
  }
}
