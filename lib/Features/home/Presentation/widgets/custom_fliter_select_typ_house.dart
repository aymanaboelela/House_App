import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_delete_icon_gender.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_filter_gender.dart';
import 'package:house_app_one/Features/home/data/cubit/filters/filters_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_toggle_button.dart';

class CustomFliterSelectTypHouse extends StatelessWidget {
  const CustomFliterSelectTypHouse({super.key});

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
                        "نوع العقار",
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
                      BlocConsumer<GethouseCubit, GethouseState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomToggleButton(
                                label: "شقه",
                                onToggle: () {
                                  BlocProvider.of<FiltersCubit>(context)
                                      .chingetyphouse(true);

                                  BlocProvider.of<FiltersCubit>(context)
                                      .isGenderIsFalse();
                                  BlocProvider.of<GethouseCubit>(context)
                                      .getDataTypHouse("شقه");
                                  Navigator.pop(context);
                                },
                                isSelected:
                                    BlocProvider.of<FiltersCubit>(context)
                                        .ishouseSelected,
                              ),
                              SizeHorizontal(value: 2),
                              CustomToggleButton(
                                  label: "استيديو",
                                  onToggle: () {
                                    BlocProvider.of<FiltersCubit>(context)
                                        .chingetyphouse(false);
                                    BlocProvider.of<FiltersCubit>(context)
                                        .isGenderIsFalse();
                                    BlocProvider.of<GethouseCubit>(context)
                                        .getDataTypHouse("استيديو");

                                    Navigator.pop(context);
                                  },
                                  isSelected:
                                      BlocProvider.of<FiltersCubit>(context)
                                          .isStudioelected),
                            ],
                          );
                        },
                      )
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
                CustomDeleteIconGender(),
              ],
            );
          },
        );
      },
      child: Builder(
        builder: (context) => CustomFilterSelect(title: "نوع العقار"),
      ),
    );
  }
}
