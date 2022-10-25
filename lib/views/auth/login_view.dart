import 'package:flutter/material.dart';

import '../../shared/ui_helpers.dart';
import '../../layouts/auth_form.dart';
import '../../shared/form/form_helpers.dart';

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
        print('Login');
        print('Username: ${_usernameController.text}');
        print('Password: ${_passwordController.text}');
        await Future.delayed(const Duration(seconds: 3));
        widget.switchPage('Profile');
      },
    );
  }
}
