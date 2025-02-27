class AppValidators {
  static String? validateRequired(String? value,
      {String message = 'This field is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmail(String? value,
      {String message = 'Invalid email address'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return message;
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength,
      {String message = 'Too short'}) {
    if (value == null || value.length < minLength) {
      return '$message (min $minLength characters)';
    }
    return null;
  }

  static String? validateMaxLength(String? value, int maxLength,
      {String message = 'Too long'}) {
    if (value != null && value.length > maxLength) {
      return '$message (max $maxLength characters)';
    }
    return null;
  }

  static String? validateNumber(String? value,
      {String message = 'Invalid number'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    final number = num.tryParse(value);
    if (number == null) {
      return message;
    }
    return null;
  }

  static String? validatePassword(String? value,
      {String message = 'Weak password'}) {
    if (value == null || value.isEmpty) {
      return message;
    }
    const pattern =
        r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return '$message (min 6 chars, 1 uppercase, 1 number, 1 special char)';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, String? originalPassword,
      {String message = 'Passwords do not match'}) {
    if (value == null || value.isEmpty || value != originalPassword) {
      return message;
    }
    return null;
  }
}
