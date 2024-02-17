import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/costom_house_item.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_fliter_select_typ_house.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_llocation.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/filters.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/assets.dart';
import '../../data/models/house_model.dart';
class CustomScrollHouse extends StatelessWidget {
  const CustomScrollHouse({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<HouseModel> data = BlocProvider.of<GethouseCubit>(context).data;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kHelpView);
            },
            icon: Icon(
              Icons.view_headline_sharp,
              color: Color.fromARGB(255, 237, 237, 237),
              size: SizeConfig.defaultSize! * 2.6,
            ),
          ),
          title: Text(
            "AkOdO",
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w700,
              // color: Color.fromARGB(255, 228, 199, 7),
            ),
          ),
          actions: [
            GestureDetector(
              onDoubleTap: () {
                FirebaseAuth.instance.currentUser == null
                    ? GoRouter.of(context).push(AppRouter.KLoginView)
                    : GoRouter.of(context).push(AppRouter.KAdminHome);
                ;
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
        const SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizeHorizontal(
                  value: 1,
                ),
                CustomFilterGender(),
                SizeHorizontal(value: 1),
                CustomFliterSelectTypHouse()
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 3),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: data.length,
            (context, index) {
              return CustomhouseItem(
                index: index,
                data: data[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
