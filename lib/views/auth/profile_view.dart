// basic profile view with a logout button

import 'package:flutter/material.dart';

import '../../../shared/ui_helpers.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Profile',
              style: TextStyle(fontSize: 30),
            ),
            verticalSpaceMedium,
            ElevatedButton(
              onPressed: () => logout(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
