import 'package:flutter/material.dart';

import '/services/auth.dart' as auth;
import 'login_view.dart';
import 'profile_view.dart';
import 'signup_view.dart';

class AuthView extends StatefulWidget {
  final Function(bool newStatus) isLoggedIn;

  const AuthView({super.key, required this.isLoggedIn});

  @override
  State<StatefulWidget> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  String _pageState = 'Login';

  // switch between login and register
  void _switchPageState(String pageState) {
    setState(() {
      _pageState = pageState;
    });

    if (pageState == 'Profile') {
      widget.isLoggedIn(true);
    } else {
      widget.isLoggedIn(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_pageState) {
      case 'Login':
        return LoginView(switchPage: _switchPageState);
      case 'Signup':
        return SignupView(switchPage: _switchPageState);
      case 'Profile':
        return ProfileView(logout: () async {
          await auth.logout();
          _switchPageState('Login');
        });
      default:
        return Container();
    }
  }
}
