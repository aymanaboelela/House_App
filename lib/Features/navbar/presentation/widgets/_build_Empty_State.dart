  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';
  class CustomIsFavoretIsEmpty extends StatelessWidget {
  const CustomIsFavoretIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AppAssets.favorite),
          Text(
            "قم باضافه سكن الي المفضله",
            style: GoogleFonts.cairo(fontSize: 25),
          ),
        ],
      ),
    );;
  }
}