import 'package:flutter/material.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';

 abstract class CustomAppBar{
  static PreferredSizeWidget customAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    elevation: BorderSide.strokeAlignOutside,
    backgroundColor: AppColors.purple,
    shadowColor: Color(0xff053936),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: "Cairo",
      )
    ),
  );
}
}