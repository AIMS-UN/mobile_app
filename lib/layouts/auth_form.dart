import 'package:flutter/material.dart';

import '/shared/ui_helpers.dart';

class FormLayout extends StatefulWidget {
  final String? title;
  final String submitText;
  final Future<void> Function()? onSubmit;
  final List<Widget> form;
  final bool showTerms;

  final ValueNotifier<String>? responseMessage;

  final void Function()? onForgotPassword;
  final void Function()? onAlreadyHaveAccount;
  final void Function()? onCreateAccount;

  const FormLayout({
    super.key,
    this.title,
    this.submitText = 'Submit',
    this.onSubmit,
    required this.form,
    this.onForgotPassword,
    this.onAlreadyHaveAccount,
    this.onCreateAccount,
    this.showTerms = false,
    this.responseMessage,
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
            if (widget.title != null)
              Text(
                widget.title!,
                style: Theme.of(context).textTheme.headline3,
              ),
            if (widget.title != null) verticalSpaceMedium,
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
            if (widget.responseMessage != null)
              ValueListenableBuilder<String>(
                valueListenable: widget.responseMessage!,
                builder: (context, value, child) {
                  if (value.isEmpty) return const SizedBox.shrink();
                  return Column(
                    children: [
                      Text(
                        value,
                        style: const TextStyle(color: Colors.red),
                      ),
                      verticalSpaceSmall,
                    ],
                  );
                },
              ),
            if (_busy && widget.onSubmit != null)
              const CircularProgressIndicator(),
            if (!_busy && widget.onSubmit != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => _busy = true);
                    await widget.onSubmit?.call();
                    setState(() => _busy = false);
                  }
                },
                child: Text(widget.submitText),
              ),
            verticalSpaceMedium,
            if (widget.onAlreadyHaveAccount != null)
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: widget.onAlreadyHaveAccount,
                  child: Text(
                    // 'Already have an account? Login',
                    '¿Ya tienes una cuenta? Inicia sesión',
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
                    // 'Don\'t have an account? Create one',
                    '¿No tienes una cuenta? Crea una',
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
                  // color: Theme.of(context).primaryColor, black
                  color: Colors.black,
                  fontSize: 14,
                  // fontWeight: FontWeight.w600,
                  // bold
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
