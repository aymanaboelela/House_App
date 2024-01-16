import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive.dart';


  class CoustomProductDescription extends StatelessWidget {
  const CoustomProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 16,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الوصف",
              style: GoogleFonts.cairo(fontSize: 22),
            ),
            SizeVertical(value: 0.5),
            Text(
              "شقه سوبر لوكس فرش اول ولاد بجانب الجامعه مساعه 5 دقا]ق الكهرباء والمياه علي صاحب السكن ",
              style: GoogleFonts.cairo(fontSize: 17),
              maxLines: 4,
            )
          ],
        ),
      ),
    );
  }
}


