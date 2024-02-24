import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image.asset(
                AppAssets.logo,
              ),
            ),
            SizeVertical(value: 1),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "الاشعارات",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kNotifacationView);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "اختيار الجامعه",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.KLocationInuniversityView);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    "مساعده",
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.kHelpView);
              },
            ),
            // يمكنك إضافة المزيد من عناصر القائمة حسب احتياجاتك
          ],
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 2.5,
          left: 0,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        )
      ],
    );
  }
}
