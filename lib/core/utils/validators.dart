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
