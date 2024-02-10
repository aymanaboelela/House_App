import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/Features/product/presentation/widgets/image_scrrol.dart';
import 'package:house_app_one/core/utils/responsive.dart';

import '../../../../core/thems/app/app_colors.dart';

class CoustomProductItem extends StatelessWidget {
  const CoustomProductItem({
    super.key,
    required this.data,
  });

  final HouseModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 32,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KPrimeColor,
      ),
      child: Column(
        children: [
          ScrollImage(data: data, autoPlay: true),
          const SizeVertical(value: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "${data.price} ج/ الشهر",
                style: GoogleFonts.cairo(
                  fontSize: SizeConfig.defaultSize! * 2.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "ID : ${data.idHouse}",
                style: GoogleFonts.cairo(
                  fontSize: SizeConfig.defaultSize! * 2.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer()
            ],
          ),

          // SizeVertical(value: 1),
        ],
      ),
    );
  }
}
