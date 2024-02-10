import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/models/get_house_mangers_model/get_house_mangers_model.dart';
import 'package:house_app_one/Features/product/presentation/widgets/image_scrrol_get_house_manger.dart';

import '../../../../../../core/thems/app/app_colors.dart';
import '../../../../../../core/utils/responsive.dart';

class CustomHouseMangerItem extends StatelessWidget {
  const CustomHouseMangerItem({super.key, required this.data});

  final HouseMangerModel data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: SizeConfig.defaultSize! * 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.KPrimeColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScrollImageGethousemanger(data: data, autoPlay: false),
                      SizeVertical(value: 1),
                      Text(
                        data.addreseHouse!,
                        maxLines: 5,
                        style: GoogleFonts.cairo(fontSize: 22),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Icon(
                        FontAwesomeIcons.x,
                        color: Colors.black,
                      )),
                )
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          padding: EdgeInsetsDirectional.all(8),
          // height: SizeConfig.defaultSize! * ,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.KPrimeColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${data.idHouse} : ID ",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
              Text(
                "الاسم: ${data.nameManger}",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
              Text(
                "رقم التلفون :${data.phoneNumber} ",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
              Text(
                "جامعه:${data.nameOfUniversity} ",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
              Text(
                "الدور :${data.groundHouse} ",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
              Text(
                "العنوان : ${data.addreseHouse}",
                maxLines: 1,
                style: GoogleFonts.cairo(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
