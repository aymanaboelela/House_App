import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';

class customDontInternet extends StatelessWidget {
  const customDontInternet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.nointernet),
        Center(
            child: Text("رجاء الاتصال بالانترنت",
                style: GoogleFonts.cairo(fontSize: 30)))
      ],
    );
  }
}