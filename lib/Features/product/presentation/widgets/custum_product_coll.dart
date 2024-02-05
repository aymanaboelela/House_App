import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/cool_item.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import '../../../../core/thems/app/app_colors.dart';
import '../../../../core/utils/responsive.dart';

class CustomProductCall extends StatelessWidget {
  const CustomProductCall({
    super.key,
    required this.data,
  });
  final HouseModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 18,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KPrimeColor,
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
            SizeVertical(value: 1),
            Text(
              "اضغط علي رمز الاتصال او الوتساب",
              style: GoogleFonts.cairo(fontSize: 18),
            ),
            const SizeVertical(value: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CollItem(data: data),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
