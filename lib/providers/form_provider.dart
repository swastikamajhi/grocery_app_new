import 'package:flutter/material.dart';
import 'package:new_app/utils/regex_extension.dart';

class FormProvider with ChangeNotifier {
  


  

  String? nameValidator(String? name) {
    if (name == '' || name == null) {
      return 'Name cannot be empty';
    } else if (!name.isValidName) {
      return 'Invalid Name';
    } else {
      return null;
    }
  }

  String? emailValidator(String? email) {
    if (email == '' || email == null) {
      return 'Email cannot be empty';
    } else if (!email.isValidEmail) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  String? phoneNoValidator(String? phoneNo) {
    if (phoneNo == '' || phoneNo == null) {
      return 'Phone No cannot be empty';
    } else if (!phoneNo.isValidPhone) {
      return 'Invalid Phone No';
    } else {
      return null;
    }
  }

  String? passwordValidator(String? password) {
    if (password == '' || password == null) {
      return 'Password cannot be empty';
    } else if (!password.isValidPassword) {
      return 'Invalid Password';
    } else {
      return null;
    }
  }
}
