import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

abstract class CustomError {
  static void error(
    BuildContext context, {
    required DialogType dialogType,
    required String title,
    required String desc,
    Function()? btnCancelOnPress,
    Function()? btnOkOnPress,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: desc,
      btnOkText: "نعم",
      btnCancelText: "لا",
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
    )..show();
  }
}
 // DialogType.error