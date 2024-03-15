import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/Splach/view/widgets/splash_view_body.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/add_not_facation_cubit.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/get_notfacation/get_notfacation_cubit.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_dont_internet.dart';
import 'package:house_app_one/core/utils/assets.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/shered_preferences/shared_preferences.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OnBoardingViewBody> {
  @override
  late StreamSubscription<ConnectivityResult> subscription;
  void initState() {
    BlocProvider.of<GetNotfacationCubit>(context).getTokenWithUser();
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
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  final data = [
    const CustomPageView(
        title: 'سكن مغتربين ',
        subtitle: 'هتلاقي السكن المناسب وبالسعر المناسب ',
        image: AppAssets.onbording1,
        backgroundColor: Color.fromARGB(255, 188, 64, 165),
        titleColor: Colors.white,
        subtitleColor: Colors.white),
    const CustomPageView(
        title: 'جامعه MTi',
        subtitle: 'هتلاقي سكنك جمب الجامعه',
        image: AppAssets.onbording2,
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        subtitleColor: Colors.grey),
    const CustomPageView(
        title: 'اقل عموله',
        subtitle: 'هتقدر تاجر سرير او شقه باقل عموله ',
        image: AppAssets.onbording3,
        backgroundColor: Colors.deepPurpleAccent,
        titleColor: Colors.white,
        subtitleColor: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return showNoInternetAnimation
        ? customDontInternet()
        : Scaffold(
            body: ConcentricPageView(
              curve: Curves.ease,
              // direction: Axis.vertical,
              itemCount: data.length,
              colors: data.map((e) => e.backgroundColor).toList(),
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (int index) {
                return data[index];
              },
              nextButtonBuilder: (context) {
                return Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 30,
                );
              },
              onFinish: () {
                CacheData.setData(key: "hasSeenOnboarding", value: true);
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                //
                userToken != null
                    ? BlocProvider.of<AddNotFacationCubit>(context)
                        .addTokenInFirebaseWithUser(userToken!)
                    : customDontInternet();
              },
            ),
          );
  }

  bool showNoInternetAnimation = false;
  Future<void> chikInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print("لايوجد انترنت");
      setState(() {
        showNoInternetAnimation = true;
      });
    } else {
      setState(
        () {
          showNoInternetAnimation = false;
        },
      );
    }
  }
}
