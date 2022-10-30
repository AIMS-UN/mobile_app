String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }
  // check if email is valid
  if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
      .hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  // must be at least 8 characters
  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }
  // must contain at least one uppercase letter
  if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  // must contain at least one lowercase letter
  if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  // must contain at least one number
  if (!RegExp(r'^(?=.*[0-9])').hasMatch(value)) {
    return 'Password must contain at least one number';
  }
  return null;
}

String? validateConfirmPassword(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a username';
  }
  if (!RegExp(r'^[a-z]{3,}$').hasMatch(value)) {
    return 'Username must be all lowercase and contain no numbers or special characters';
  }
  return null;
}
