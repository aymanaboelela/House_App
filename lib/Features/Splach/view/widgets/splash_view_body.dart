import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/get_notfacation/get_notfacation_cubit.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/responsive.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;
  @override
  void initState() {
    BlocProvider.of<GetNotfacationCubit>(context).getTokenWithUser();
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: .2, end: 1).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });
    animationController?.repeat(reverse: true);
    getToNewScreen();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
  bool hasSeenOnboarding = CacheData.getdata(key: 'hasSeenOnboarding') ?? false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 25, 25, 25),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          // Image.asset(kBackGrawendSplash),
          AnimatedBuilder(
            animation: animation!,
            builder: (context, _) => Opacity(
              opacity: animation?.value,
              child: Center(
                child: Image.asset(
                  AppAssets.logo,
                  height: SizeConfig.defaultSize! * 25,
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            "رقم الاصدار : 1.0.0",
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "Cairo",
            ),
          ),
          SizeVertical(value: 2)
        ],
      ),
    );
  }

  void getToNewScreen() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      hasSeenOnboarding == false
          ? GoRouter.of(context).pushReplacement(
              AppRouter.kOnBoardingView,
            )
          : GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    });
  }
}

String? userToken;
