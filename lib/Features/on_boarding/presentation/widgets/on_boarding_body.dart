import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/Splach/view/widgets/splash_view_body.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/shered_preferences/shared_preferences.dart';
import 'custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<OnBoardingViewBody> {
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
    return Scaffold(
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
          token != null
              ? addTokenInFirebase(token!)
              : CustomError.error(context,
                  dialogType: DialogType.error,
                  title: "خطاء!",
                  desc: "قم باتصال بانترنت واعد تشغيل التطبيق ");
          ;
        },
      ),
    );
  }

  Future<void> addTokenInFirebase(String token) async {
    await FirebaseFirestore.instance.collection('usertoken').doc(token).set({
      'userToken': token,
      'message': "",
      'time': "",
    }, SetOptions(merge: true));
  }
}
