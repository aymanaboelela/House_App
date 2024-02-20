import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';

import '../../../../core/thems/app/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class CustomProductDetailsFeatures extends StatelessWidget {
  const CustomProductDetailsFeatures({
    super.key,
    required this.data,
  });

  final HouseModel data;

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
                  data.wifi
                      ? Row(
                          children: [
                            const Icon(Icons.wifi),
                            SizeHorizontal(value: 0.5),
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
                  data.naturalgas
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
                  data.airConditioner
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
              SizeVertical(value: 3),
              data.romeSingel
                  ? Row(
                      children: [
                        const Icon(Icons.single_bed),
                        const SizeHorizontal(value: 0.5),
                        Text(
                          "غرفه سنجل",
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
        ),
      ),
    );
  }
}
