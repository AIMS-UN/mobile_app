import 'package:flutter/material.dart';

import '../shared/ui_helpers.dart';

class FormLayout extends StatefulWidget {
  final String title;
  final String submitText;
  final Future<void> Function() onSubmit;
  final List<Widget> form;
  final bool showTerms;

  final void Function()? onForgotPassword;
  final void Function()? onAlreadyHaveAccount;
  final void Function()? onCreateAccount;

  const FormLayout({
    super.key,
    required this.title,
    required this.submitText,
    required this.onSubmit,
    required this.form,
    this.onForgotPassword,
    this.onAlreadyHaveAccount,
    this.onCreateAccount,
    this.showTerms = false,
  });

  @override
  State<StatefulWidget> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  final _formKey = GlobalKey<FormState>();

  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title, style: Theme.of(context).textTheme.headline3!),
            verticalSpaceMedium,
            ...widget.form,
            if (widget.onForgotPassword != null) verticalSpaceSmall,
            if (widget.onForgotPassword != null)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: widget.onForgotPassword,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            verticalSpaceMedium,
            _busy
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => _busy = true);
                        await widget.onSubmit();
                        setState(() => _busy = false);
                      }
                    },
                    child: Text(widget.submitText),
                  ),
            if (widget.onAlreadyHaveAccount != null)
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: widget.onAlreadyHaveAccount,
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            else if (widget.onCreateAccount != null)
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: widget.onCreateAccount,
                  child: Text(
                    'Don\'t have an account? Create one',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            if (widget.onAlreadyHaveAccount != null) verticalSpaceTiny,
            if (widget.showTerms) verticalSpaceRegular,
            if (widget.showTerms)
              Text(
                'By signing up, you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
