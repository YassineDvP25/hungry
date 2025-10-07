emailValidation(value) {
  if (value == null || value.isEmpty) {
    return "Please enter your email";
  }
  if (!value.contains("@")) {
    return "Enter a valid email";
  }
  return null;
}

passwordValidation(value) {
  if (value == null || value.isEmpty) {
    return "Please enter your password";
  }
  if (value.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}
nameValidation(value) {
  if (value == null || value.isEmpty) {
    return "Please enter your name";
  }
  if (value.length < 3) {
    return "Name must be at least 3 characters";
  }
  return null;
}

phoneValidation(value) {
  if (value == null || value.isEmpty) {
    return "Please enter your phone number";
  }
  final phoneRegExp = RegExp(r'^[0-9]+$');
  if (!phoneRegExp.hasMatch(value)) {
    return "Phone number must contain only digits";
  }
  if (value.length < 9) {
    return "Enter a valid phone number";
  }
  return null;
}

