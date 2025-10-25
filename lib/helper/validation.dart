import '../config.dart';

class Validation {
  RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
  RegExp passRegex = RegExp(
      "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$");
  RegExp zipRegex = RegExp("^d{5}(?:[-s]d{4})?\$");

  // Zip Code Validation
  String? zipCodeValidation(context, zipCode) {
    if (zipCode.isEmpty) {
      return language(context, appFonts.enterZip);
    }
    return null;
  }

// City validation
  String? cityValidation(context, name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseCity);
    }
    return null;
  }

  // address validation
  String? addressValidation(context, name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseAddress);
    }
    return null;
  }

  // Email Validation
  String? emailValidation(context, userName) {
    if (userName.isEmpty) {
      return language(context, "Please Enter Email");
    } /*else if (!digitRegex.hasMatch(email)) {
      return language(context, appFonts.pleaseEnterValid);
    }*/
    return null;
  }

  // Password Validation
  String? passValidation(context, password) {
    if (password.isEmpty) {
      return language(context, appFonts.pleaseEnterPassword);
    }

    return null;
  }

//confirm Password Validation
  String? confirmPassValidation(context, password, pass) {
    if (password.isEmpty) {
      return language(context, appFonts.pleaseEnterPassword);
    }

    if (password != pass) {
      return language(context, appFonts.notMatch);
    }
    return null;
  }

  // name validation
  String? nameValidation(context, name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseEnterName);
    }
    return null;
  }

  // phone validation
  String? phoneValidation(context, phone) {
    if (phone.isEmpty) {
      return language(context, appFonts.pleaseEnterNumber);
    }
    if (!regex.hasMatch(phone)) {
      return language(context, appFonts.pleaseEnterValidNumber);
    }
    return null;
  }

  // Otp Validation
  String? otpValidation(context, value) {
    if (value!.isEmpty) {
      return language(context, appFonts.enterOtp);
    }
    if (!regex.hasMatch(value)) {
      return language(context, appFonts.enterValidOtp);
    }
    return null;
  }

  // Common field validation
  commonValidation(context, value) {
    if (value!.isEmpty) {
      return language(context, "Please enter email");
    }
  }

  commonMessageValidation(context, value) {
    if (value!.isEmpty) {
      return language(context, "Please enter message");
    }
  }

//focus node change
  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // dynamic field validation
  dynamicTextValidation(context, value, text) {
    if (value!.isEmpty) {
      return language(context, text);
    }
  }
}
