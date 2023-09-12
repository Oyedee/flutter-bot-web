class Validators {
  static String countryCode = '';
  static String phoneNumber = '';
  static int availableUnits = 0;
  static double walletBalance = 0.0;

  static String? isEmailStr(String? email, {String error = "Invalid email address/password kindly check again"}) {
    return email!.isEmpty
        ? 'Kindly enter your email address'
        : isEmail(email)!
            ? null
            : error;
  }

  static bool? isEmail(String? email) {
    if (email != null) {
      String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
          "\\@" +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{1,64}" +
          "(" +
          "\\." +
          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
          ")+";
      return RegExp(p).hasMatch(email);
    }
    return null;
  }

  static String? validateOTP(String value) {
    if (value.length != 6) {
      return 'OTP code should contain 6 characters';
    }
    return null;
  }

  static bool isNumeric(String number) {
    if (number == null) {
      return false;
    }
    return double.tryParse(number) != null;
  }

  static String? validatePhoneNumber(String value) {
    // if (value.startsWith("0")) {
    //   return "please remove leading '0' from mobile number";
    // }
    if (value.length != 11) {
      return 'Invalid phone number';
    }
    if (!isNumeric(value)) {
      return 'Enter valid phone number';
    }
    return null;
  }

  static String? validateReferralCode(String value) {
    if (value.isEmpty) {
      return null;
    } else {
      if (value.length > 10) {
        return 'Invalid referral code';
      }
      if (value.length < 3) {
        return 'Invalid referral code';
      }
    }
    return null;
  }

  static String? validateIsEmpty(String? value) {
    if (value != null && value.isEmpty) return 'Required !!!';
    return null;
  }

  static String? validatePin(String? value) {
    if (value != null && value.length < 4) {
      return 'Pin can only be 4 digits !!!';
    }

    return null;
  }

  static String? validateIsEmptyWithLengthAndNumber(String? value) {
    if (value != null) {
      if (!isDigit(value)) {
        if (value.isEmpty) {
          return 'Kindly enter your first name';
        } else if (value.length < 2) {
          return 'Kindly enter your first name';
        }
      } else {
        return 'Remove Digits!!';
      }
    }
    return null;
  }

  static String? validateLastNameIsEmptyWithLengthAndNumber(String? value) {
    if (value != null) {
      if (!isDigit(value)) {
        if (value.isEmpty) {
          return 'Kindly enter your last name';
        } else if (value.length < 2) {
          return 'Kindly enter your last name';
        }
      } else {
        return 'Remove Digits!!';
      }
    }
    return null;
  }

  static String? validateDropDown(String? value) {
    if (value == null || value.isEmpty) return 'Required !!!';
  }

  static String? validateNumericField(String? value) {
    if (value != null) {
      if (value.length < 1) return 'Required !!!';

      if (num.tryParse(value) == null) return "Invalid input";
    }
  }

  static String? validateCVV(String? value) {
    if (value != null) {
      if (value.length < 3) return 'Enter CVV';

      if (num.tryParse(value) == null) return "Invalid CVV";
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    /*const pattern1 = '123';
    const pattern2 = '234';
    const pattern3 = '345';
    const pattern4 = '456';
    const pattern5 = '567';
    const pattern6 = '789';*/

    if (value != null && value.length < 6) {
      return 'Password does not meet requirements';
    }
    /*if (value!.contains(pattern1)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern2)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern3)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern4)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern5)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern6)) {
      return 'Password cannot contain illegal character sequence';
    }*/
    return null;
  }

  static String? validateBvn(String? value) =>
      value == null || value.length < 11 || value.length > 11 ? 'BVN is invalid, input a valid BVN' : null;

  static String? validateSignUpPassword(String? value) {
    /* const pattern1 = '123';
    const pattern2 = '234';
    const pattern3 = '345';
    const pattern4 = '456';
    const pattern5 = '567';
    const pattern6 = '789';*/
    if (value != null && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$/&*~]).{8,}$').hasMatch(value)) {
      return 'Password must include an uppercase letter, a lowercase letter, a special character, a number and have at least 8 characters';
    }
    /*if (value!.contains(pattern1)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern2)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern3)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern4)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern5)) {
      return 'Password cannot contain illegal character sequence';
    }
    if (value.contains(pattern6)) {
      return 'Password cannot contain illegal character sequence';
    }*/
    return null;
  }

  static String? validateNuban(String? value) {
    if (value != null && (value.length != 10 || int.tryParse(value) == null)) {
      return "Enter a valid account number";
    }
    return null;
  }

  static String? phoneController() {
    return phoneNumber;
  }

  static void getPhonenumber(String? value) {
    phoneNumber = value.toString();
  }

  static bool isDigit(String s) {
    final b = RegExp(r'^[0-9]').hasMatch(s);

    return b;
  }

  static bool isNotBlank(String input) {
    return (input != null && input.trim().isNotEmpty && (input.compareTo('null') != 0));
  }

  static bool isBlank(String input) => !isNotBlank(input);
}
