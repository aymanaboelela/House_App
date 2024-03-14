import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_data_is_empty.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_house_item._in_home_view.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_all_houses_fliter.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_fliter_select_typ_house.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_llocation.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/filters.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
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
    data = BlocProvider.of<GethouseCubit>(context).data;
    super.initState();
  }

  List<HouseModel> data = [];
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
                AllHousesFltier(),
                SizeHorizontal(value: 1),
                CustomFilterGender(),
                SizeHorizontal(value: 1),
                CustomFliterSelectTypHouse(),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 3),
        ),
        SliverList.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return data.isEmpty
                ? CustomDataIsEmpty()
                : CustomhouseItem(
                    data: data[index],
                  );
          },
        ),
      ],
    );
  }
}
