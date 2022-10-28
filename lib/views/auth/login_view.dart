import 'package:flutter/material.dart';

import '../../widgets/background.dart';
import '/layouts/auth_form.dart';
import '/services/auth.dart' as auth;
import '/shared/form/form_helpers.dart';
import '/shared/ui_helpers.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _responseMessage = ValueNotifier<String>('');

  Future<void> _onSubmit(Function callback) async {
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
    callback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: FormLayout(
          title: 'Login',
          submitText: 'Login',
          form: <Widget>[
            formUsername(_usernameController),
            verticalSpaceSmall,
            formPassword(_passwordController),
            verticalSpaceSmall,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "menu");
              },
              child: const Text("Go to menu"),
            )
          ],
          responseMessage: _responseMessage,
          onCreateAccount: () => Navigator.pushNamed(context, "register"),
          onSubmit: () => _onSubmit(() => Navigator.pushNamed(context, "menu")),
        ),
      ),
    );
  }
}
