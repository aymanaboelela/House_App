import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/Custom_select_gender.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_filter_gender.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';

import '../../../../core/utils/responsive.dart';

class CustomFilters extends StatelessWidget {
  const CustomFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return Stack(children: [
              Container(
                height: SizeConfig.defaultSize! * 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.KPrimeColor,
                ),
                child: Column(
                  children: [
                    const SizeVertical(value: 2),
                    Text(
                      "نوع المستاجر",
                      style: GoogleFonts.cairo(fontSize: 20),
                    ),
                    const SizeVertical(value: 1),
                    const Divider(
                      endIndent: 30,
                      indent: 30,
                      height: 15,
                      color: Colors.white38,
                    ),
                    const SizeVertical(value: 1),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSelectGender(
                            genger: "شباب",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizeHorizontal(value: 2),
                          CustomSelectGender(
                            genger: "بنات",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_outlined)),
              )
            ]);
          },
        );
      },
      child:const CustomFilterGender(),
    );
  }
}


