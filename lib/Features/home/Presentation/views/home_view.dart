import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../data/cubit/gethouse/gethouse_cubit.dart';
import '../widgets/costom_prodact.dart';
import '../widgets/custom_llocation.dart';
import '../widgets/filters.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoding = false;

  @override
  void initState() {
    //  BlocProvider.of<GethouseCubit>(context).getData();
    super.initState();
    setState(() {
      getGat();
    });
  }

  List data = [];
  Future getGat() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('houses').get();
    data.addAll(querySnapshot.docs);
  }

  @override
  Widget build(BuildContext context) {
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
                          typeHouse: data[index]["Type House"],
                          price: data[index]["Price"],
                          description: data[index]["Description"],
                          genger: data[index]["Gender"],
                          numpersOfBad: data[index]["Number Of Beds"]);
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
        ));
  }
}
