import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive.dart';

class CustomFilterGender extends StatelessWidget {
  const CustomFilterGender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 4.2,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "النوع",
              style: GoogleFonts.cairo(fontSize: 12),
            ),
            const SizeHorizontal(value: 0.9),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
            )
          ],
        ),
      ),
    );
  }
}
