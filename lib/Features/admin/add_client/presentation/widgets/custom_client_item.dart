import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_client/data/models/client_model.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/thems/app/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/responsive.dart';

class CustomClientItem extends StatelessWidget {
  const CustomClientItem({super.key, required this.data});

  final clientModel data;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: SizeConfig.defaultSize! * 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.KPrimeColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: data.imageUrl[0],
                        placeholder: (context, url) => Center(
                            child: Lottie.asset(AppAssets.Loding,
                                height: SizeConfig.defaultSize! * 30)),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 30,
                        ),
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.fill,
                      ),
                      SizeVertical(value: 1),
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
                "الاسم: ${data.nameclient}",
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
                "العموله :${data.price} ",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
              Text(
                "التاريخ: ${DateFormat('yyyy - MM - dd').format(data.date!.toDate())}",
                style: GoogleFonts.cairo(fontSize: 23),
              ),
              SizeVertical(value: 1),
            ],
          ),
        ),
      ),
    );
  }
}
