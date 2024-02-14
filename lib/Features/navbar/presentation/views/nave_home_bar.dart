import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/Presentation/views/home_view.dart';
import 'package:house_app_one/Features/navbar/presentation/views/favoret_view.dart';
import 'package:house_app_one/Features/location/presentation/views/location_view.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class NavBarHome extends StatefulWidget {
  const NavBarHome({Key? key});

  @override
  State<NavBarHome> createState() => _NavBarHomeState();
}

List screens = [HomeView(), FavoriteProductsView(),  LocationView()];

int curantIndex = 0;


class _NavBarHomeState extends State<NavBarHome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[curantIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: SizeConfig.defaultSize! * 5,
        backgroundColor: Colors.transparent,
        color: Colors.grey.shade800,
        buttonBackgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          curantIndex = index; // Change here
          setState(() {});
        },
        index: curantIndex,
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.location_pin,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
