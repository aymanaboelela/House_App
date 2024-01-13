import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_on_sharp,
            ))
      ],
    );
  }
}
