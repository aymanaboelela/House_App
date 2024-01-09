import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.backgroundColor,
      required this.titleColor,
      required this.subtitleColor});

  final String title;
  final String subtitle;
  final String image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizeVertical(value: 9),
          SizedBox(
              height: SizeConfig.screenHeight! * 0.35,
              child: Image.asset(image)),
          const SizeVertical(value: 2),
          Text(
            title.toUpperCase(),
            style: GoogleFonts.cairo(
              color: titleColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              // overflow: TextOverflow.clip
            ),
          ),
          const SizeVertical(value: 1.7),
          Text(
            subtitle,
            style: GoogleFonts.lemonada(
              color: subtitleColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              // overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
