import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_popup_menu_whith_unversty_locatin.dart';
import 'package:house_app_one/core/shered_preferences/App_cach_data.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/utils/app_route.dart';

class CustomLocationAndNotifacation extends StatelessWidget {
  const CustomLocationAndNotifacation({super.key});

  @override
  Widget build(BuildContext context) {
    String? universityLocation =
        CacheData.getdata(key: AppChachData.loocationUniversity);
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.red,
              size: 25,
            ),
            Text(
              universityLocation ?? "MTI",
              style: GoogleFonts.lemonada(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomPopupMenuWhithUnverstyLocation(),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kNotifacationView);
          },
          icon: const Icon(
            Icons.notifications_on_sharp,
          ),
        ),
      ],
    );
  }
}
