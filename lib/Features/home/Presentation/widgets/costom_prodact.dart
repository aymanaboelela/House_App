import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/cubit/favoret/favoret_cubit.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/Features/product/presentation/view/product_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/responsive.dart';
import '../../../product/presentation/widgets/image_scrrol.dart';
import 'custom_coll.dart';

class CustomProduct extends StatefulWidget {
  const CustomProduct({
    super.key,
    required this.data,
    required this.indix,
  });
  final HouseModel data;
  final int indix;

  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoretCubit>(context).getData();
    setState(() {});
  }

  String? phoneNumber = "01225796476";
  @override
  Widget build(BuildContext context) {
    bool isFavorite = FavoriteProducts.products.contains(widget.data);
    return BlocConsumer<FavoretCubit, FavoretState>(
      listener: (context, state) {
        // if (state is GetDataState) {
        //   BlocProvider.of<FavoretCubit>(context).getData();
        // }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: InkWell(
            onTap: () {
              // GoRouter.of(context).push(AppRouter.KProductView,extra:data );
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProductView(data: widget.data);
                },
              ));
            },
            child: Stack(children: [
              Container(
                height: SizeConfig.defaultSize! * 42,
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
                    ScrollImage(data: widget.data, autoPlay: false),
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
                            " ${widget.data.price} ج/ الشهر",
                            style: GoogleFonts.cairo(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizeVertical(value: 0.5),
                          Text(
                            widget.data.description,
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
                              const Spacer(),
                              Row(
                                children: [
                                  CustomColl(
                                    onTap: () {
                                      _makePhoneCall(phoneNumber!);
                                    },
                                    color: Colors.blue,
                                    icon: Icons.phone,
                                  ),
                                  const SizeHorizontal(value: 1.5),
                                  CustomColl(
                                    onTap: () {
                                      String massege =
                                          " لو سمحت عاوزاستفسر عن شقه Id : ${widget.data.idHouse}";
                                      _launchWhatsApp(phoneNumber!, massege);
                                    },
                                    color: const Color(0xFF4EFF75),
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
                    if (isFavorite) {
                      // Remove from favorites
                      FavoriteProducts.products.remove(widget.data);
                    } else {
                      // Add to favorites
                      FavoriteProducts.products.add(widget.data);
                    }
                    isFavorite = !isFavorite;
                    // Trigger a rebuild
                    BlocProvider.of<FavoretCubit>(context).setData(isFavorite);
                  },
                  icon: isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: SizeConfig.defaultSize! * 3.5,
                        )
                      : Icon(
                          Icons.favorite_border,
                          size: SizeConfig.defaultSize! * 3,
                        ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchWhatsApp(String phoneNumber, String massege) async {
    String url = "whatsapp://send?phone=$phoneNumber&text=$massege";
     if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Can't launch WhatsApp");
  }
  }
}

class FavoriteProducts {
  static List<HouseModel> products = [];
}
