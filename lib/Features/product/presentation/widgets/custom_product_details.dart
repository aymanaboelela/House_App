import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive.dart';

class CustomProductDetails extends StatelessWidget {
  const CustomProductDetails({
    super.key,
    required this.typeHouse,
    required this.numberOfBeds,
    required this.numberOfRooms,
  });
  final String typeHouse;
  final String numberOfBeds;
  final String numberOfRooms;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 11,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white12,
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
                    "نوع العقار :  شقه",
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                    ),
                  ),
                  const SizeHorizontal(value: 8.2),
                  Text(
                    "${typeHouse} : نوع الاستجار",
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizeVertical(value: 3),
              Row(
                children: [
                  Text(
                    "${numberOfBeds} : عدد الغرف",
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                    ),
                  ),
                  const SizeHorizontal(value: 10.2),
                  Text(
                    "${numberOfRooms} : عدد السرائر",
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
