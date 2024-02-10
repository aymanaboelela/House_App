import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/app_route.dart';

import '../widgets/custom_admin_select.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "صفحه الادمن",
            style: GoogleFonts.cairo(),
          ),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد العناصر في كل سطر
            crossAxisSpacing: 8.0, // المسافة بين العناصر الأفقية
            mainAxisSpacing: 8.0, // المسافة بين العناصر الرأسية
          ),
          children: [
            CustomAdminSelect(
              title: "اضافه اشعارات",
              icon: Icons.notifications_active_rounded,
              onTap: () {},
            ),
            CustomAdminSelect(
              title: "اضافه شقه",
              icon: Icons.home_work_rounded,
              onTap: () => GoRouter.of(context).push(AppRouter.KAddProductView),
            ),
            CustomAdminSelect(
              title: "البحث عن شقه",
              icon: Icons.search_sharp,
              onTap: () => GoRouter.of(context).push(AppRouter.KSearchInHouse),
            ),
            CustomAdminSelect(
              title: "سجل صاحب العقار",
              icon: Icons.person_add_alt_1,
              onTap: () {},
            ),
            CustomAdminSelect(
              title: "اضافه المستاجر",
              icon: FontAwesomeIcons.users,
              onTap: () {},
            ),
          ],
        ));
  }
}
