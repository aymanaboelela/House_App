import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_route.dart';
import '../../../admin_home/presentation/widgets/custom_admin_select.dart';

class ClinetDetailsView extends StatelessWidget {
  const ClinetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "سجل المستاجرين ",
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
              title: "اضافه  مستاجر",
              icon: Icons.person_add,
              onTap: () => GoRouter.of(context).push(AppRouter.KAddClientView),
            ),
            CustomAdminSelect(
              title: "البحث عن مستاجر",
              icon: Icons.person_search_rounded,
              onTap: () =>
                  GoRouter.of(context).push(AppRouter.KSearchClientView),
            ),
            CustomAdminSelect(
              title: " المستاجرين",
              icon: Icons.house_outlined,
              onTap: () => GoRouter.of(context).push(AppRouter.KGetClientView),
            ),
          ],
        ),
      ),
    );
  }
}
