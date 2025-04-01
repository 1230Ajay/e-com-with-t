import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { error, warning, alert, success }

class AppToast {
  static void showToast(String message, {ToastType type = ToastType.error}) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case ToastType.error:
        backgroundColor = Colors.red;
        icon = Icons.error;
        break;
      case ToastType.warning:
        backgroundColor = Colors.orange;
        icon = Icons.warning;
        break;
      case ToastType.alert:
        backgroundColor = Colors.blue;
        icon = Icons.info;
        break;
      case ToastType.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle;
        break;
    }

    Fluttertoast.showToast(
      msg: "   $message   ", // Adding spaces for a more rounded appearance
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
      webBgColor: "#${backgroundColor.value.toRadixString(16)}",
    );
  }
}
