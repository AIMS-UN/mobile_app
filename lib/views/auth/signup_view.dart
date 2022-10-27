import 'package:flutter/material.dart';

import '/layouts/auth_form.dart';
import '/services/auth.dart' as auth;
import '/shared/form/form_helpers.dart';
import '/shared/ui_helpers.dart';

class SignupView extends StatefulWidget {
  final Function(String pageState) switchPage;

  const SignupView({super.key, required this.switchPage});

  @override
  State<StatefulWidget> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _roleController = TextEditingController();

  final _responseMessage = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      title: 'Signup',
      submitText: 'Signup',
      form: <Widget>[
        formUsername(_usernameController),
        verticalSpaceSmall,
        formPassword(_passwordController),
        verticalSpaceSmall,
        formConfirmPassword(_confirmPasswordController, _passwordController),
        verticalSpaceSmall,
        formDropdown(
          label: 'Role',
          items: ['Student', 'Teacher'],
          selectedItem: 'Student',
          controller: _roleController,
        ),
        verticalSpaceSmall,
      ],
      responseMessage: _responseMessage,
      onAlreadyHaveAccount: () => widget.switchPage('Login'),
      onSubmit: () async {
        final response = await auth.register(
          _usernameController.text,
          _passwordController.text,
          _roleController.text.toLowerCase(),
        );

        if (response['error'] != null) {
          print('Error: ${response['error']}');
          _responseMessage.value = response['error'];
          return;
        }

        print('Success: ${response['data']['username']}');
        widget.switchPage('Profile');
      },
      showTerms: true,
    );
  }
}
