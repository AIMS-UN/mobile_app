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
      // labelText: 'Password',
      labelText: 'Contraseña',
      // hintText: 'Enter your password',
      hintText: 'Ingrese su contraseña',
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
      // labelText: 'Confirm Password',
      labelText: 'Confirmar contraseña',
      // hintText: 'Confirm your password',
      hintText: 'Confirme su contraseña',
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
      // labelText: 'Username',
      labelText: 'Nombre de usuario',
      // hintText: 'Enter your username',
      hintText: 'Ingrese su nombre de usuario',
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
    isExpanded: true,
    decoration: InputDecoration(
      labelText: label,
    ),
    value: selectedItem,
    items: items
        .map(
          (item) => DropdownMenuItem<T>(
            value: item,
            child: Text(
              item.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
        .toList(),
    onChanged: (value) {
      controller.text = value.toString();
    },
  );
}
