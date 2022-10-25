import 'package:flutter/material.dart';

import '../services/auth.dart' as auth;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String response = '';

  final username = 'mi username';
  final password = '123123123';
  final role = 'teacher';

  TextEditingController user = TextEditingController();
  TextEditingController passwordd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                Image.asset("assets/buho.png", height: 200),
                const SizedBox(height: 5),
                TextField(
                  controller: user,
                  decoration: const InputDecoration(hintText: "username"),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passwordd,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "password"),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () async {
                      final Map<String, dynamic> data = await auth.login(
                        username,
                        password,
                      );
                      setState(() {
                        response = data.toString();
                      });
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                // TextButton(
                //  onPressed: () async {
                //     final Map<String, dynamic> data = await auth.login(
                //       username,
                //       password,
                //     );
                //     setState(() {
                //       response = data.toString();
                //     });
                //   },
                //   child: const Text('Login'),
                // ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    final Map<String, dynamic> data = await auth.register(
                      username,
                      password,
                      role,
                    );
                    setState(() {
                      response = data.toString();
                    });
                  },
                  child: const Text('Register'),
                ),
                // TextButton(
                //   onPressed: () async {
                //     final Map<String, dynamic> data = await auth.myAccount();
                //     setState(() {
                //       response = data.toString();
                //     });
                //   },
                //   child: const Text('My Account'),
                // ),
                // TextButton(
                //   onPressed: () async {
                //     final Map<String, dynamic> data = await auth.logout();
                //     setState(() {
                //       response = data.toString();
                //     });
                //   },
                //   child: const Text('Logout'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
