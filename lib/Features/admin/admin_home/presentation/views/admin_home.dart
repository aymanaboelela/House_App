import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/get_notfacation/get_notfacation_cubit.dart';
import 'package:house_app_one/Features/admin/admin_home/presentation/widgets/custom_drawer_admin.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import '../widgets/custom_admin_select.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetNotfacationCubit>(context).getTokenWithAdmin();
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
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        children: [
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
            onTap: () => GoRouter.of(context).push(AppRouter.KMangerDeailsView),
          ),
          CustomAdminSelect(
            title: "سجل المستاجر",
            icon: FontAwesomeIcons.users,
            onTap: () =>
                GoRouter.of(context).push(AppRouter.KClinetDetailsView),
          ),
          CustomAdminSelect(
            title: "الرسال ",
            icon: Icons.chat,
            onTap: () => GoRouter.of(context).push(AppRouter.KChatsInEdmin),
          ),
        ],
      ),
      endDrawer: CustomAdminDrawer(),
    );
  }
}
