import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/app_route.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation({super.key});

  @override
  Widget build(BuildContext context) {
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
              "MTi",
              style: GoogleFonts.lemonada(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_outlined)
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
