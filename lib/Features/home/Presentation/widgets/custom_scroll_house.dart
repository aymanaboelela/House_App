import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/bottom_sheates/custom_bottme_sheates.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_data_is_empty.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_filter_select.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_house_item._in_home_view.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_llocation.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/Features/home/data/models/fliters_modes.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/assets.dart';
import '../../data/models/house_model.dart';

class CustomScrollHouse extends StatefulWidget {
  const CustomScrollHouse({
    super.key,
  });

  @override
  State<CustomScrollHouse> createState() => _CustomScrollHouseState();
}

class _CustomScrollHouseState extends State<CustomScrollHouse> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GethouseCubit>(context).getData();
  }

  List<FlitersModel> fliters(BuildContext context) => [
        FlitersModel(
          name: "كل العقارات",
          onTap: () => bottomSheetInAllHouses(context),
        ),
        FlitersModel(
          name: "نوع المستاجر",
          onTap: () => bottomSheateIsGenger(context),
        ),
        FlitersModel(
          name: "نوع العقار",
          onTap: () => bottomSheettyphouse(context),
        ),
      ];

  List<HouseModel> data = [];
  int selectFilter = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: Text(
            "AkOdO",
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            GestureDetector(
              onDoubleTap: () {
                FirebaseAuth.instance.currentUser == null
                    ? GoRouter.of(context).push(AppRouter.KLoginView)
                    : GoRouter.of(context).push(AppRouter.KAdminHome);
              },
              child: Image.asset(
                AppAssets.logo,
              ),
            ),
          ],
          expandedHeight: 20,
        ),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 1),
        ),
        const SliverToBoxAdapter(
          child: CustomLocationAndNotifacation(),
        ),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 1),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 46,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fliters(context).length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: InkWell(
                    onTap: () {
                      fliters(context)[index].onTap();
                      if (selectFilter != index) {
                        setState(() {
                          selectFilter = index;
                        });
                      }
                    },
                    child: CustomFilterSelect(
                        title: fliters(context)[index],
                        isSelect: selectFilter == index),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 3),
        ),
        BlocConsumer<GethouseCubit, GethouseState>(
          listener: (context, state) {
            if (state is IsFailureGetHouse) {
              CustomError.error(
                context,
                dialogType: DialogType.error,
                title: "فشل",
                desc: "فشلت جلب العقارات",
              );
            }
            if (state is IsDataIsEmptyGetHouse) {
              CustomError.error(
                context,
                dialogType: DialogType.info,
                title: "مشكله",
                desc: "لايوجد عقار بهذا الوصف حاول في وقت اخر",
              );
            }
          },
          builder: (context, state) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (state is IsLodingGetHouse) {
                    return Lottie.asset(AppAssets.Loding1);
                  } else if (state is IsSuccessGetHouse) {
                    final data = state.data;
                    return data.isEmpty
                        ? CustomDataIsEmpty()
                        : CustomhouseItem(data: data[index]);
                  }
                  return CustomDataIsEmpty();
                },
                childCount: state is IsSuccessGetHouse ? state.data.length : 1,
              ),
            );
          },
        ),
      ],
    );
  }
}
