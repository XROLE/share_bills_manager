import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastHelper {
  ToastHelper();

  static Future<void> dismiss() async {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }

  static void showToast(
      {required String title,
      required String message,
      Duration duration = const Duration(milliseconds: 3500)}) {
    Get.snackbar(
      title,
      message,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        key: Key("flush_bar"),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeIn,
      duration: duration,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
    );
  }

  static void showError({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 6),
    bool isPersistent = false,
  }) {
    Get.snackbar(
      title,
      message,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        key: Key("flush_bar"),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeIn,
      duration: duration,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
    );
  }

  static void showNetworkError(
      {required String title,
      required String message,
      Duration duration = const Duration(milliseconds: 3500),
      bool isPersistent = false}) {
    Get.snackbar(
      title,
      message,
      snackStyle: SnackStyle.GROUNDED,
      messageText: Text(
        message,
        key: Key("flush_bar"),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeIn,
      duration: isPersistent ? null : duration,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
    );
  }

  static void showSuccess(
      {required String title,
      required  String message,
      Duration duration = const Duration(seconds: 5)}) {
    Get.snackbar(
      title,
      message,
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        key: Key("flush_bar"),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      reverseAnimationCurve: Curves.easeIn,
      forwardAnimationCurve: Curves.easeIn,
      duration: duration,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
    );
  }

  static void showFetching(
      {required String title, required String message, Duration duration = const Duration(seconds: 90)}) {
    Get.snackbar(title, message,
        snackStyle: SnackStyle.FLOATING,
        messageText: Text(
          message,
          key: Key("flush_bar"),
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        reverseAnimationCurve: Curves.easeIn,
        forwardAnimationCurve: Curves.easeIn,
        duration: duration,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        showProgressIndicator: true,
        progressIndicatorValueColor: AlwaysStoppedAnimation(Colors.white),
        margin: EdgeInsets.only(bottom: 40));
  }
}
