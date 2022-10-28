// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  static const String id = 'profile';
  const ProfileView({super.key});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.indigo[900],
            width: double.infinity,
            height: 400,
            child: const Center(
              child: Text(
                "Im in profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.indigo[800],
            width: double.infinity,
            height: 400,
            child: const Center(
              child: Text(
                "Im in profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.indigo[700],
            width: double.infinity,
            height: 400,
            child: const Center(
              child: Text(
                "Im in profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
