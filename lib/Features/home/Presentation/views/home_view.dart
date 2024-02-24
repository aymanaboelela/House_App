import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_drawer.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_scroll_house.dart';
import 'package:house_app_one/Features/home/data/cubit/filters/filters_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/widgets/custom_error_massege.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoding = true;
  @override
  void initState() {
    getToken();
    getNotfacation();
    super.initState();
    BlocProvider.of<GethouseCubit>(context).getData();
    setState(() {});
  }

  void getNotfacation() {
    FirebaseMessaging.onMessage.listen(
      (event) {
        print("seccess in notfacation");
      },
    );
  }

  void getToken() async {
    var Token = await FirebaseMessaging.instance.getToken();
    print("//////////////////////////////////////////////");
    print(Token);
    print("////////////////////////////////////////////");
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GethouseCubit, GethouseState>(
      listener: (context, state) {
        if (state is IsLodingGetHouse) {
          isLoding = true;
        } else if (state is IsSucssesGetHouse) {
          isLoding = false;
        } else if (state is IsFeilerGetHouse) {
          isLoding = false;
        } else if (state is IsDataIsEmptyGetHouse) {
          isLoding = false;
          CustomError.error(context,
              dialogType: DialogType.info,
              title: "مشكله",
              desc: "لايوجد عقار بهذا الوصف حاول في وقت اخر");
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: CustomDrawer(),
          body: ModalProgressHUD(
            inAsyncCall: state is IsLodingGetHouse ? true : false,
            progressIndicator: Lottie.asset(AppAssets.Loding1,
                fit: BoxFit.fill, height: SizeConfig.defaultSize! * 11),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: RefreshIndicator(
                displacement: 50.0,
                onRefresh: () {
                  return refreshData(context);
                },
                child: CustomScrollHouse(),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> refreshData(BuildContext context) {
    if (BlocProvider.of<FiltersCubit>(context).isFemaleSelected == true) {
      return BlocProvider.of<GethouseCubit>(context).getDataGender("بنات");
    } else if (BlocProvider.of<FiltersCubit>(context).isMaleSelected == true) {
      return BlocProvider.of<GethouseCubit>(context).getDataGender("شباب");
    } else if (BlocProvider.of<FiltersCubit>(context).ishouseSelected == true) {
      return BlocProvider.of<GethouseCubit>(context).getDataTypHouse("شقه");
    } else if (BlocProvider.of<FiltersCubit>(context).isStudioelected == true) {
      return BlocProvider.of<GethouseCubit>(context).getDataTypHouse("استيديو");
    } else {
      return BlocProvider.of<GethouseCubit>(context).getData();
    }
  }
}


