import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/thems/app/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/data/cubit/coll/coll_cubit.dart';

class CustomProductCall extends StatelessWidget {
  const CustomProductCall({
    super.key,
    required this.data,
  });
  final HouseModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 20,
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
                InkWell(
                  onTap: () {
                    BlocProvider.of<CollCubit>(context).makePhoneCall();
                  },
                  child: Container(
                    height: SizeConfig.defaultSize! * 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Lottie.asset(AppAssets.phone,
                        height: SizeConfig.defaultSize! * 4),
                  ),
                ),
                SizeHorizontal(value: 3.2),
                InkWell(
                  onTap: () {
                    BlocProvider.of<CollCubit>(context)
                        .launchWhatsApp(data.idHouse);
                  },
                  child: Container(
                    height: SizeConfig.defaultSize! * 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Lottie.asset(
                      AppAssets.whatsapp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
