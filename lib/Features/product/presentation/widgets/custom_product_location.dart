import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

class CustomProductLocation extends StatelessWidget {
  const CustomProductLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      // height: SizeConfig.defaultSize! * 19,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KPrimeColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "موقع الجامعه ",
            style: GoogleFonts.cairo(fontSize: 22),
          ),
          SizeVertical(value: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "القاهره \nالمقطم,الهضبه الوسطي",
                style: GoogleFonts.cairo(fontSize: 17),
              ),
              Spacer(),
              InkWell(
                onTap: () => GoRouter.of(context).push(AppRouter.KLocationView),
                child: CircleAvatar(
                  radius: SizeConfig.defaultSize! * 5,
                  backgroundImage: AssetImage(AppAssets.locationPhoto),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
