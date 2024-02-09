import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../data/cubit/favorite/favorite_cubit.dart';
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
              dialogType: DialogType.error,
              title: "خطاء",
              desc: " برجاء المحاوله في وقت لاحق");
        }
      },
      builder: (context, state) {
        List<HouseModel> data = BlocProvider.of<GethouseCubit>(context).data;
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isLoding,
            progressIndicator: Lottie.asset(AppAssets.Loding1,
                fit: BoxFit.fill, height: SizeConfig.defaultSize! * 11),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: RefreshIndicator(
                displacement: 50.0,
                onRefresh: () {
                  return BlocProvider.of<GethouseCubit>(context).getData();
                },
                child: CustomScrollView(
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
                        Image.asset(
                          AppAssets.logo,
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
                            index: index,
                            data: data[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // add product
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.KAddProductView);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
