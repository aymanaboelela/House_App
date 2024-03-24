
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/appbar_in_homeview.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_fliters_Listveiw.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_houses_items_list_view.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_llocation.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
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
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const AppBarInHomeView(),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 1),
        ),
        const SliverToBoxAdapter(
          child: CustomLocationAndNotifacation(),
        ),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 1),
        ),
        const CustomFlitersListView(),
        const SliverToBoxAdapter(
          child: SizeVertical(value: 3),
        ),
        CustomHousesItemsListView(),
      ],
    );
  }
}
