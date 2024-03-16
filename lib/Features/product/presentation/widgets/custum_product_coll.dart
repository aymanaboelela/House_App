import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/Features/product/presentation/widgets/custom_call_item.dart';
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
      // height: SizeConfig.defaultSize! * 20,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KPrimeColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "التواصل",
              style: GoogleFonts.cairo(
                fontSize: SizeConfig.defaultSize! * 2,
              ),
            ),
            SizeVertical(value: 1),
            Text(
              "اضغط علي رمز الاتصال او الوتساب",
              style: GoogleFonts.cairo(
                fontSize: SizeConfig.defaultSize! * 1.5,
              ),
            ),
            const SizeVertical(value: 3),
            CustomCallItem(phoneNumber: '01021196367', data: data),
            SizeVertical(value: 2),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            Text(
              "رقم اخر ",
              style: GoogleFonts.cairo(
                fontSize: SizeConfig.defaultSize! * 2,
              ),
            ),
            SizeVertical(value: 1.5),
            CustomCallItem(phoneNumber: '01202692317', data: data),
            SizeVertical(value: 2),
          ],
        ),
      ),
    );
  }
}

