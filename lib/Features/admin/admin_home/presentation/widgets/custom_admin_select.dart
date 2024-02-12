import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class CustomAdminSelect extends StatelessWidget {
  const CustomAdminSelect(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final IconData icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeConfig.defaultSize! * 19,
        width: SizeConfig.defaultSize! * 19,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.KPrimeColor),
        child: Column(children: [
          SizeVertical(value: 2),
          Icon(
            icon,
            size: SizeConfig.defaultSize! * 11,
          ),
          SizeVertical(value: 1),
          Text(
            title,
            style: GoogleFonts.cairo(fontSize: SizeConfig.defaultSize! * 1.9),
          )
        ]),
      ),
    );
  }
}
