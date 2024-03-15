import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/Features/product/presentation/widgets/custom_image_scrrol.dart';
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
          CustomScrollImage(data: data, autoPlay: true),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "${data.price} ج/ الشهر",
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.2,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo"),
              ),
              const Spacer(),
              Text(
                "ID : ${data.idHouse}",
                style: TextStyle(
                    fontSize: SizeConfig.defaultSize! * 2.2,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo"),
              ),
              const Spacer()
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
