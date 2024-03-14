import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/thems/app/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class CustomProductDetails extends StatelessWidget {
  const CustomProductDetails({
    super.key,
    required this.typeHouse,
    required this.numberOfBeds,
    required this.numberOfRooms,
    required this.gender,
  });
  final String typeHouse;
  final String numberOfBeds;
  final String gender;
  final String numberOfRooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 11,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KPrimeColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "نوع العقار : $typeHouse",
                    style: GoogleFonts.cairo(
                      fontSize: SizeConfig.defaultSize! * 1.6,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "عدد الغرف : $numberOfBeds",
                    style: GoogleFonts.cairo(
                      fontSize: SizeConfig.defaultSize! * 1.6,
                    ),
                  ),
                  SizeHorizontal(value: 7),
                ],
              ),
              const SizeVertical(value: 3),
              Row(
                children: [
                  Text(
                    "نوع السكن : $gender",
                    style: GoogleFonts.cairo(
                      fontSize: SizeConfig.defaultSize! * 1.6,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "عدد السرائر : $numberOfRooms",
                    style: GoogleFonts.cairo(
                      fontSize: SizeConfig.defaultSize! * 1.6,
                    ),
                  ),
                  SizeHorizontal(value: 7),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
