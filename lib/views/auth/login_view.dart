import 'package:flutter/material.dart';

import '/shared/ui_helpers.dart';
import '/layouts/auth_form.dart';
import '/shared/form/form_helpers.dart';
import '/services/auth.dart' as auth;

class LoginView extends StatefulWidget {
  final Function(String pageState) switchPage;

  const LoginView({
    super.key,
    required this.switchPage,
  });

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      title: 'Login',
      submitText: 'Login',
      form: <Widget>[
        formUsername(_usernameController),
        verticalSpaceSmall,
        formPassword(_passwordController),
        verticalSpaceSmall,
      ],
      onForgotPassword: () => widget.switchPage('ForgotPassword'),
      onCreateAccount: () => widget.switchPage('Signup'),
      onSubmit: () async {
        final response = await auth.login(
          _usernameController.text,
          _passwordController.text,
        );

        if (response['error'] != null) {
          print('Error: ${response['error']}');
        } else {
          print('Success: ${response['username']}');
          widget.switchPage('Profile');
        }
      },
    );
  }
}
