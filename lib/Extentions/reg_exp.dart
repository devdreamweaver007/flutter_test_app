class FieldValidator {
 static bool isFieldEmpty(String input) {
    return input.trim().isEmpty;
  }

  static bool isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static bool hasNoSpace(String input) {
    return input.contains(' ');
  }
}
