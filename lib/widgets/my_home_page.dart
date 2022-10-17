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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Response: ',
            ),
            Text(
              response,
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () async {
                final Map<String, dynamic> data = await auth.login(
                  username,
                  password,
                );
                setState(() {
                  response = data.toString();
                });
              },
              child: const Text('Login'),
            ),
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
            TextButton(
              onPressed: () async {
                final Map<String, dynamic> data = await auth.myAccount();
                setState(() {
                  response = data.toString();
                });
              },
              child: const Text('My Account'),
            ),
            TextButton(
              onPressed: () async {
                final Map<String, dynamic> data = await auth.logout();
                setState(() {
                  response = data.toString();
                });
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
