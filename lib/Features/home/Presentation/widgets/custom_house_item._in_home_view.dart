import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/cool_item.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_divider.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/favoret_item.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/Features/product/presentation/view/product_view.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import '../../../../core/utils/responsive.dart';
import '../../../product/presentation/widgets/custom_image_scrrol.dart';

class CustomhouseItem extends StatefulWidget {
  const CustomhouseItem({
    super.key,
    required this.data,
  });
  final HouseModel data;

  @override
  State<CustomhouseItem> createState() => _CustomhouseItemState();
}

class _CustomhouseItemState extends State<CustomhouseItem> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ProductView(data: widget.data);
            },
          ));
        },
        child: Stack(children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.KPrimeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomScrollImage(data: widget.data, autoPlay: false),
                const SizeVertical(value: 1),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.defaultSize! * 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.typeHouse,
                        style: GoogleFonts.cairo(
                          fontSize: 13,
                        ),
                      ),
                      const SizeVertical(value: 0.4),
                      Text(
                        "${widget.data.price} ج/ الشهر",
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizeVertical(value: 0.6),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          widget.data.description,
                          style: GoogleFonts.vazirmatn(
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizeVertical(value: 2),
                      CustomDivider(),
                      const SizeVertical(value: 1),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.home),
                              const SizeHorizontal(value: 0.3),
                              Text(
                                widget.data.gender,
                                style: GoogleFonts.cairo(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizeHorizontal(value: 2),
                          Row(
                            children: [
                              const Icon(Icons.bed_rounded),
                              const SizeHorizontal(value: 0.4),
                              Text(
                                widget.data.numpersOfBad,
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizeHorizontal(value: 2),
                          Row(
                            children: [
                              const Icon(Icons.houseboat_outlined),
                              const SizeHorizontal(value: 0.4),
                              Text(
                                widget.data.nameOfUniversity,
                                style: GoogleFonts.cairo(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CollItem(
                            data: widget.data,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizeVertical(value: 1.5),
              ],
            ),
          ),
          Positioned(
            left: 0,
            child: FavoretIconItem(
              data: widget.data,
            ),
          ),
        ]),
      ),
    );
  }
}
