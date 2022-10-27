import 'package:flutter/material.dart';

import 'form_validators.dart';

Widget formEmail(TextEditingController controller) {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: 'Email',
      hintText: 'Enter your email',
    ),
    validator: validateEmail,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: (value) => controller.text = value,
  );
}

Widget formPassword(TextEditingController controller) {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: 'Password',
      hintText: 'Enter your password',
    ),
    validator: validatePassword,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: (value) => controller.text = value,
    obscureText: true,
  );
}

Widget formConfirmPassword(
    TextEditingController controller, TextEditingController confirm) {
  return TextFormField(
    decoration: const InputDecoration(
      labelText: 'Confirm Password',
      hintText: 'Confirm your password',
    ),
    validator: (value) => validateConfirmPassword(value, confirm.text),
    onChanged: (value) => controller.text = value,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    obscureText: true,
  );
}

Widget formUsername(TextEditingController controller) {
  TextFormField username = TextFormField(
    decoration: const InputDecoration(
      labelText: 'Username',
      hintText: 'Enter your username',
    ),
    validator: validateUsername,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onChanged: (value) => controller.text = value,
  );
  return Row(
    children: <Widget>[
      Expanded(
        child: username,
      ),
      const Text('@unal.edu.co'),
    ],
  );
}

Widget formDropdown<T>({
  required String label,
  required List<T> items,
  required T selectedItem,
  required TextEditingController controller,
}) {
  return DropdownButtonFormField<T>(
    decoration: InputDecoration(
      labelText: label,
    ),
    value: selectedItem,
    items: items
        .map(
          (item) => DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          ),
        )
        .toList(),
    onChanged: (value) {
      controller.text = value.toString();
    },
  );
}
