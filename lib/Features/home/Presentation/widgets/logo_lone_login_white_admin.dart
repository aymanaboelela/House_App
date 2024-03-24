import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';

class LogoJoneLoginWhithAdmin extends StatelessWidget {
  const LogoJoneLoginWhithAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        FirebaseAuth.instance.currentUser == null
            ? GoRouter.of(context).push(AppRouter.KLoginView)
            : GoRouter.of(context).push(AppRouter.KAdminHome);
      },
      child: Image.asset(
        AppAssets.logo,
      ),
    );
  }
}
