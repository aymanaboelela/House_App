import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/data/cubit/filters/filters_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

class CustomDeleteIconGender extends StatefulWidget {
  const CustomDeleteIconGender({super.key});

  @override
  State<CustomDeleteIconGender> createState() => _CustomDeleteIconGenderState();
}

class _CustomDeleteIconGenderState extends State<CustomDeleteIconGender> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 6,
      child: BlocProvider.of<FiltersCubit>(context).isFemaleSelected == false &&
              BlocProvider.of<FiltersCubit>(context).isMaleSelected == false &&
              BlocProvider.of<FiltersCubit>(context).ishouseSelected == false &&
              BlocProvider.of<FiltersCubit>(context).isStudioelected == false
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete))
          : InkWell(
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<FiltersCubit>(context).isFemaleSelected = false;
                BlocProvider.of<FiltersCubit>(context).isMaleSelected = false;
                BlocProvider.of<FiltersCubit>(context).ishouseSelected = false;
                BlocProvider.of<FiltersCubit>(context).isStudioelected = false;
                setState(() {});
              },
              child: Lottie.asset(AppAssets.delete,
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 4),
            ),
    );
  }
}
