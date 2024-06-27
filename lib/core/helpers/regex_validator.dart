import 'package:pms_app/core/constants/app_strings.dart';

abstract class RegexValidator {
  static const emailRegex =
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$';
  static const phoneRegex = r'^[0-9,--+-]+$';
  static const numberRegex = r'^[0-9]+$';
  static const passwordRegex8CharactersInLength = r'^.{8,}';
  static const nameRegex = r'^[\u0600-\u06FFa-zA-Z\s]+$';

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emailIsRequired;
    } else if (!RegExp(emailRegex).hasMatch(value)) {
      return AppStrings.theEmailIsNotValid;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.nameIsRequired;
    } else if (!RegExp(nameRegex).hasMatch(value)) {
      return AppStrings.theNameIsNotValid;
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.thisFieldIsRequired;
    }
    return null;
  }

  static String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.thisFieldIsRequired;
    }
    if (!RegExp(numberRegex).hasMatch(value)) {
      return AppStrings.itIsNotNumber;
    }
    return null;
  }

  static String? validateVerifyCode(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.thisFieldIsRequired;
    }
    if (!RegExp(numberRegex).hasMatch(value)) {
      return AppStrings.itIsNotNumber;
    } else if (value.length > 6) {
      return AppStrings.itJustConsistsOf6Digits;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneNumberIsRequired;
    }
    if (!RegExp(phoneRegex).hasMatch(value)) {
      return AppStrings.itIsNotPhoneNumber;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordIsRequired;
    } else if (!RegExp(passwordRegex8CharactersInLength).hasMatch(value)) {
      return AppStrings.itShouldBeAtLeas8CharactersLong;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? pass) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordConfirmationIsRequired;
    } else if (value != pass) {
      return AppStrings.thereIsNoMatch;
    }
    return null;
  }

  static bool startsWithEnglishChar(String value) {
    RegExp englishCharRegex = RegExp(r'^[a-zA-Z0-9٠-٩]');
    return englishCharRegex.hasMatch(value);
  }

  static bool isOnlySpaces(String value) {
    return value.trim().isEmpty;
  }
}
