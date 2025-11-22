extension StringExtension on String {
  bool get isValidEmail {
    if (isEmpty) {
      return false;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this)) {
      return false;
    }
    return true;
  }

  bool get isValidOtp {
    if (isEmpty) {
      return false;
    }
    return true;
  }
}
