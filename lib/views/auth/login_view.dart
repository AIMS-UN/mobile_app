import 'package:flutter/material.dart';

import '/layouts/auth_form.dart';
import '/services/auth.dart' as auth;
import '/shared/form/form_helpers.dart';
import '/shared/ui_helpers.dart';

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

  final _responseMessage = ValueNotifier<String>('');

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
      responseMessage: _responseMessage,
      onSubmit: () async {
        final response = await auth.login(
          _usernameController.text,
          _passwordController.text,
        );

        if (response['error'] != null) {
          print('Error: ${response['error']}');
          _responseMessage.value = response['error'];
          return;
        }

        print('Success: ${response['data']['username']}');
        widget.switchPage('Profile');
      },
    );
  }
}
