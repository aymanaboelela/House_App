import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/responsive.dart';

class CustomFilterSelect extends StatelessWidget {
  const CustomFilterSelect({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: SizeConfig.defaultSize! * 9,
      height: SizeConfig.defaultSize! * 4.3,
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
          children: [
            Text(title, style: TextStyle(fontFamily: "Cairo", fontSize: 13)),
            const SizeHorizontal(value: 0.9),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
