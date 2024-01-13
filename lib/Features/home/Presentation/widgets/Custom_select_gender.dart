import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive.dart';

class CustomSelectGender extends StatelessWidget {
  const CustomSelectGender({
    super.key,
    required this.genger,
    required this.onTap,
  });
  final String genger;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SizeConfig.defaultSize! * 12,
        height: SizeConfig.defaultSize! * 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: Colors.blue),
        child: Center(
          child: Text(
            genger,
            style: GoogleFonts.cairo(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
