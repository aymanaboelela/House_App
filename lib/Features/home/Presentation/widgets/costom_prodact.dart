import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/cubit/favoret/favoret_cubit.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import '../../../../core/utils/responsive.dart';
import 'custom_coll.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct(
      {super.key,
      required this.typeHouse,
      required this.price,
      required this.description,
      required this.genger,
      required this.numpersOfBad});

  final String typeHouse;
  final String price;
  final String description;
  final String genger;
  final String numpersOfBad;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoretCubit, FavoretState>(
      listener: (context, state) {
        if (state is FavoretCachProuduct) {
          BlocProvider.of<FavoretCubit>(context).getDataProduct();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.KProductView);
            },
            child: Stack(children: [
              Container(
                height: SizeConfig.defaultSize! * 41,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/test1.png",
                      fit: BoxFit.fill,
                      height: SizeConfig.defaultSize! * 21.5,
                      width: double.infinity,
                    ),
                    const SizeVertical(value: 1),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.defaultSize! * 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            typeHouse,
                            style: GoogleFonts.cairo(
                              fontSize: 13,
                            ),
                          ),
                          const SizeVertical(value: 0.4),
                          Text(
                            " ${price} ج/ الشهر",
                            style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizeVertical(value: 0.5),
                          Text(
                            description,
                            style: GoogleFonts.mirza(
                              fontSize: 18,
                            ),
                            maxLines: 1,
                          ),
                          const SizeVertical(value: 2),
                          const Divider(
                            color: Colors.white,
                            height: 4,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizeVertical(value: 1),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.home),
                                  const SizeHorizontal(value: 0.3),
                                  Text(
                                    genger,
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
                                    numpersOfBad,
                                    style: GoogleFonts.cairo(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  CustomColl(
                                    onTap: () {},
                                    icon: Icons.phone,
                                  ),
                                  const SizeHorizontal(value: 1.5),
                                  CustomColl(
                                    onTap: () {},
                                    icon: FontAwesomeIcons.whatsapp,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<FavoretCubit>(context).setDataProduct();
                  },
                  icon: BlocProvider.of<FavoretCubit>(context).isfavoriteProduct
                      ? const Icon(Icons.favorite_border)
                      : Icon(
                          Icons.favorite,
                          color: BlocProvider.of<FavoretCubit>(context)
                                  .isfavoriteProduct
                              ? Colors.grey
                              : Colors.red,
                          size: SizeConfig.defaultSize! * 3.5,
                        ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
