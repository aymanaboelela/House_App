import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/add_Product/data/cubit/add_house_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/costom_prodact.dart';
import '../widgets/custom_llocation.dart';
import '../widgets/filters.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoding = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GethouseCubit>(context).getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GethouseCubit, GethouseState>(
      listener: (context, state) {
        if (state is IsLodingGetHouse) {
          isLoding = true;
        }
        if (state is IsSucssesGetHouse) {
          isLoding = false;
        }
        if (state is IsFeilerGetHouse) {
          isLoding = false;
          CustomError.error(context,
              dialogType: DialogType.error, title: "خطاء", desc: "خطاء");
        }
      },
      builder: (context, state) {
        List<HouseModel> data = BlocProvider.of<GethouseCubit>(context).data;
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isLoding,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Image.asset(
                      AssetsData.logo,
                      height: 20,
                    ),
                    expandedHeight: 20,
                  ),
                  const SliverToBoxAdapter(
                    child: SizeVertical(value: 1),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomLocation(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizeVertical(value: 1),
                  ),
                  const SliverToBoxAdapter(
                    child: CustomFilters(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizeVertical(value: 3),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: data.length,
                      (context, index) {
                        return CustomProduct(
                          data: data[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.KAddProduct);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
