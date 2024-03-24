import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';

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
