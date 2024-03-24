import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/logo_lone_login_white_admin.dart';

class AppBarInHomeView extends StatelessWidget {
  const AppBarInHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text(
        "AkOdO",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: "Cairo",
        )
      ),
      actions: [
        LogoJoneLoginWhithAdmin(),
      ],
      expandedHeight: 20,
    );
  }
}
