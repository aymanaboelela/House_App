import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_drawer_home_view.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_scroll_house.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/refresh_indicator_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: const Color.fromARGB(255, 49, 43, 43),
          displacement: 50.0,
          onRefresh: () {
            return refreshData(context);
          },
          child: CustomScrollHouse(),
        ),
      ),
      drawer: CustomDrawerHomeView(),
    );
  }
}
