import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

class NotifyHelper {
  NotifyHelper._();
  static void success(BuildContext context, String message) {
    FlushbarHelper.createSuccess(
      message: message,
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  static void error(BuildContext context, String message) {
    FlushbarHelper.createError(
      message: message,
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  static void info(BuildContext context, String message) {
    FlushbarHelper.createInformation(
      message: message,
      duration: const Duration(seconds: 2),
    ).show(context);
  }
}
