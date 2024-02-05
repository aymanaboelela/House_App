import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../core/thems/app/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class CustomProductDetails2 extends StatelessWidget {
  const CustomProductDetails2({
    super.key,
    required this.isWiFi,
    required this.isAirConditioner,
    required this.isNaturalgas,
  });
  final bool isWiFi;
  final bool isAirConditioner;
  final bool isNaturalgas;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.defaultSize! * 17,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KPrimeColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مميزات الشقه ",
                style: GoogleFonts.cairo(fontSize: 22),
              ),
              const SizeVertical(value: 2),
              Row(
                children: [
                  const Icon(Icons.weekend_outlined),
                  const SizeHorizontal(value: 0.5),
                  Text(
                    " مفروشه",
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                    ),
                  ),
                  const SizeHorizontal(value: 8.2),
                  isWiFi
                      ? Row(
                          children: [
                            const Icon(Icons.wifi),
                            SizeVertical(value: 2),
                            Text(
                              'Wi-Fi',
                              style: GoogleFonts.cairo(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      : const Row(
                          children: [],
                        ),
                ],
              ),
              const SizeVertical(value: 3),
              Row(
                children: [
                  isNaturalgas
                      ? Row(
                          children: [
                            const Icon(Icons.fire_extinguisher_rounded),
                            const SizeHorizontal(value: 0.5),
                            Text(
                              "غاز طبيعي",
                              style: GoogleFonts.cairo(
                                fontSize: 16,
                              ),
                            ),
                            const SizeHorizontal(value: 7.2),
                          ],
                        )
                      : const Row(
                          children: [],
                        ),
                  isAirConditioner
                      ? Row(
                          children: [
                            const Icon(Icons.ac_unit),
                            const SizeHorizontal(value: 0.5),
                            Text(
                              "تكيف",
                              style: GoogleFonts.cairo(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      : const Row(
                          children: [],
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
