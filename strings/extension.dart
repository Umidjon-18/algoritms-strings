extension UpperCase on String {
  bool isLetter(var element) {
    int codeIndex = element.codeUnitAt(0);
    if (codeIndex > 64 && codeIndex < 91) {
      return true;
    }
    if (codeIndex > 96 && codeIndex < 123) {
      return true;
    }
    return false;
  }

  bool isUpperCase(var element) {
    int codeIndex = element.codeUnitAt(0);
    if (codeIndex > 64 && codeIndex < 91) {
      return true;
    }
    return false;
  }

  bool isLowerCase(var element) {
    int codeIndex = element.codeUnitAt(0);
    if (codeIndex > 96 && codeIndex < 123) {
      return true;
    }
    return false;
  }
}
