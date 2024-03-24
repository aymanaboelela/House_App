import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';

class NotifacationView extends StatelessWidget {
  const NotifacationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          "الاشعارات",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.notifacation,
          ),
          Text(
            "لا يوجد اشعارات حتى الآن",
            style: GoogleFonts.cairo(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
