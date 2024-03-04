import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/chat/presentation/views/chat_whith_user_view.dart';
import 'package:house_app_one/Features/home/Presentation/views/home_view.dart';
import 'package:house_app_one/Features/navbar/presentation/views/favoret_view.dart';
import 'package:house_app_one/Features/google_maps/presentation/views/location_view.dart';

class NavBarHome extends StatefulWidget {
  const NavBarHome({Key? key});

  @override
  State<NavBarHome> createState() => _NavBarHomeState();
}

List<Widget> screens = [
  HomeView(),
  FavoriteProductsView(),
  ChatWhithUserView(),
  LocationView()
];

int currentIndex = 0;

class _NavBarHomeState extends State<NavBarHome> {
  late StreamSubscription<ConnectivityResult> subscription;

  Future<void> chikInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print("لايوجد انترنت");
      setState(() {
        showNoInternetSnackbar(context);
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
    }
  }

  void showNoInternetSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content: Center(
          child: Text(
            "برجاء الاتصال بالإنترنت",
            style: GoogleFonts.cairo(
              color: Colors.white,
            ),
          ),
        ),
        duration: Duration(days: 3),
      ),
    );
  }

  @override
  void initState() {
    chikInternet();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      chikInternet();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50, // Adjust the height according to your needs
        backgroundColor: Colors.transparent,
        color: Colors.grey.shade800,
        buttonBackgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        index: currentIndex,
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
            Icons.chat,
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

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
