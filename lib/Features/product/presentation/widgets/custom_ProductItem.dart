import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/core/utils/responsive.dart';

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
        color: Colors.white12,
      ),
      child: Column(
        children: [
          data.url != null
              ? CachedNetworkImage(
                  imageUrl: data.url!,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  alignment: Alignment.bottomCenter,
                 
                  fit: BoxFit.fill,
                  height: SizeConfig.defaultSize! * 21.5,
                  width: double.infinity,
                )
              : SizedBox(
                  height: SizeConfig.defaultSize! * 25,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          const SizeVertical(value: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "${data.price} ج/ الشهر",
                style: GoogleFonts.cairo(
                  fontSize: SizeConfig.defaultSize! * 2.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "ID : ${data.idHouse}",
                style: GoogleFonts.cairo(
                  fontSize: SizeConfig.defaultSize! * 2.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer()
            ],
          ),

          // SizeVertical(value: 1),
        ],
      ),
    );
  }
}
