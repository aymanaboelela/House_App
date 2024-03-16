import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/data/cubit/coll/coll_cubit.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

class CustomCallItem extends StatelessWidget {
  const CustomCallItem({
    super.key,
    required this.data,
    required this.phoneNumber,
  });

  final HouseModel data;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<CollCubit>(context)
                .makePhoneCall(phoneNumber: phoneNumber);
          },
          child: Container(
            height: SizeConfig.defaultSize! * 5.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Lottie.asset(AppAssets.phone,
                height: SizeConfig.defaultSize! * 4),
          ),
        ),
        SizeHorizontal(value: 3.2),
        InkWell(
          onTap: () {
            BlocProvider.of<CollCubit>(context)
                .launchWhatsApp(phoneNumber: phoneNumber, id: data.idHouse);
          },
          child: Container(
            height: SizeConfig.defaultSize! * 5.5,
            width: SizeConfig.defaultSize! * 5.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Lottie.asset(
              AppAssets.whatsapp,
            ),
          ),
        ),
      ],
    );
  }
}
