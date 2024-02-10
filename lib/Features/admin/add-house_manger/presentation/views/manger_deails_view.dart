import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/admin_home/presentation/widgets/custom_admin_select.dart';
import 'package:house_app_one/core/utils/app_route.dart';

class MangerDeailsView extends StatelessWidget {
  const MangerDeailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "سجل صاحب العقار",
          style: GoogleFonts.cairo(),
        )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            children: [
              CustomAdminSelect(
                title: "اضافه صاحب شقه",
                icon: Icons.person_4,
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.KAddHouseMangerView),
              ),
              CustomAdminSelect(
                title: "البحث عن صاحب الشقه",
                icon: Icons.person_search_rounded,
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.KSearchInMangerView),
              ),
              CustomAdminSelect(
                title: "اصحاب الشقق",
                icon: Icons.person_search_rounded,
                onTap: () =>
                    GoRouter.of(context).push(AppRouter.KHouseMangersViewe),
              ),
            ],
          ),
        ));
  }
}
