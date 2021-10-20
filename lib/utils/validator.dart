

import 'package:shared_bills_manager/utils/constant.dart';

class Validator {
  static String? validateEmail(String email){
    if(email.isEmpty){
      return  Constants.EMPTY_MAIL_STRING;
    } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return  Constants.INVALID_MAIL_STRING;
    } else {
      return null;
    }
  }
}