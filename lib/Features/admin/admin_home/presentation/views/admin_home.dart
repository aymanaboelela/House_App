import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/get_notfacation/get_notfacation_cubit.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';

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
          crossAxisCount: 2, // عدد العناصر في كل سطر
          crossAxisSpacing: 8.0, // المسافة بين العناصر الأفقية
          mainAxisSpacing: 8.0, // المسافة بين العناصر الرأسية
        ),
        children: [
          CustomAdminSelect(
            title: "اضافه اشعارات",
            icon: Icons.notifications_active_rounded,
            onTap: () => GoRouter.of(context).push(AppRouter.KAddNotfacation),
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

class CustomAdminDrawer extends StatelessWidget {
  const CustomAdminDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String email = CacheData.getdata(key: 'email');
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(AppAssets.logo),
                  ),
                  Text(
                    email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
          ListTile(
            title: Row(
              children: [
                Text(
                  "تسجيل الخروج من الحساب ",
                  style: GoogleFonts.cairo(),
                ),
                Spacer(),
                Icon(Icons.login),
              ],
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              GoRouter.of(context).pushReplacement(AppRouter.KLoginView);
            },
          ),
        ],
      ),
    );
  }
}
