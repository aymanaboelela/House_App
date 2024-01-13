import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class CoustomProductItem extends StatelessWidget {
  const CoustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 32,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white12,
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/images/test1.png",
            fit: BoxFit.fill,
            height: SizeConfig.defaultSize! * 25,
            width: double.infinity,
          ),
          const SizeVertical(value: 2),
          Text(
            "1500 ج/ الشهر",
            style: GoogleFonts.cairo(
              fontSize: SizeConfig.defaultSize! * 2.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
