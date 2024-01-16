import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import '../../../../core/utils/responsive.dart';

import '../../data/shered_preferences/shared_preferences.dart';
import 'custom_coll.dart';

class CustomProduct extends StatefulWidget {
  CustomProduct({super.key});
  @override
  State<CustomProduct> createState() => _CustomProductState();
}

class _CustomProductState extends State<CustomProduct> {
  @override
  @override
  void initState() {
    super.initState();
    initFavoriteState();
  }

  Future<void> initFavoriteState() async {
    // Initialize shared preferences before using it
    await CacheData.cacheDataInit();

    // Retrieve the favorite state from shared preferences
    bool cachedFavorite = CacheData.getdata(key: "isfavoretproduct") ?? true;

    // Update the state only if the widget is still mounted
    if (mounted) {
      setState(() {
        isfavorite = cachedFavorite;
      });
    }
  }

  bool isfavorite = true;

  @override
  Widget build(BuildContext context) {
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
                        "سرسير",
                        style: GoogleFonts.cairo(
                          fontSize: 13,
                        ),
                      ),
                      const SizeVertical(value: 0.4),
                      Text(
                        "1500 ج/ الشهر",
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizeVertical(value: 0.5),
                      Text(
                        "سكن طلاب سوبر لوكس بجانب الجامعة",
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
                                "شباب",
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
                                "6",
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
              onPressed: () async {
                // Save the updated favorite state to shared preferences
                await CacheData.setData(
                  key: "isfavoretproduct",
                  value: !isfavorite,
                );
         

                setState(() {
                  isfavorite = !isfavorite;
                });
              },
              icon: isfavorite
                  ? const Icon(Icons.favorite_border)
                  : Icon(
                      Icons.favorite,
                      color: isfavorite ? Colors.grey : Colors.red,
                      size: SizeConfig.defaultSize! * 3.5,
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
