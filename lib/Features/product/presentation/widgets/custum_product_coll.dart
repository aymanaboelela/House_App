import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/Presentation/widgets/custom_coll.dart';

class CustomProductCall extends StatelessWidget {
  const CustomProductCall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 15,
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
              "التواصل",
              style: GoogleFonts.cairo(fontSize: 22),
            ),
            const SizeVertical(value: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomColl(
                  icon: FontAwesomeIcons.phone,
                  onTap: () {},
                ),
                const SizeHorizontal(value: 4),
                CustomColl(icon: FontAwesomeIcons.whatsapp, onTap: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
