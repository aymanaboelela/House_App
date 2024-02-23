import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          "صفحه الاشعارات",
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
