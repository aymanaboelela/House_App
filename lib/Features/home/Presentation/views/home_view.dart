import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import '../widgets/costom_prodact.dart';
import '../widgets/custom_llocation.dart';
import '../widgets/filters.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                  (context, index) {
                    return const CustomProduct();
                  },
                  childCount: 10,
                ),
              ),
            ],
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
