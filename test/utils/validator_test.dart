// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:shared_bills_manager/utils/constant.dart';
import 'package:shared_bills_manager/utils/validator.dart';

void main() {
  group('Test Validator', () {
    group('Test Email validator', () {
      // Test for empty email
      test("Return error message when email is empty", () {
        expect(Validator.validateEmail(''), Constants.EMPTY_MAIL_STRING);
      });

      // Test for invalid email
      test("Return error when email is invalid", () {
        expect(Validator.validateEmail('sdfsfsd'), Constants.INVALID_MAIL_STRING);
      });

      // Test for valid email
      test("Return null when email is valid", () {
        expect(Validator.validateEmail('abc@gmail.com'), null);
      });
    });
  });
}
