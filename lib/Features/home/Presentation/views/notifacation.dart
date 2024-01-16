import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifacationView extends StatelessWidget {
  const NotifacationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "لا يوجد اشعارات حتي الان",
          style: GoogleFonts.cairo(fontSize: 20),
        ),
      ),
    );
  }
}
