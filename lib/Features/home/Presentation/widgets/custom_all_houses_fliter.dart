import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_delete_icon_gender.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_filter_gender.dart';
import 'package:house_app_one/Features/home/data/cubit/filters/filters_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_buttons.dart';

class AllHousesFltier extends StatelessWidget {
  const AllHousesFltier({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return Stack(
                children: [
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
                          "كل العقارات",
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
                        SizedBox(
                          width: SizeConfig.defaultSize! * 10,
                          child: CustomGeneralButton(
                              text: "اظهار الكل ",
                              onTap: () {
                                BlocProvider.of<GethouseCubit>(context)
                                    .getData();
                                BlocProvider.of<FiltersCubit>(context)
                                    .isGenderIsFalse();
                                BlocProvider.of<FiltersCubit>(context)
                                    .isTypHouseIsFalse();

                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_outlined),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: CustomFilterSelect(title: "كل العقارات"));
  }
}
