import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/Splach/view/widgets/splash_view_body.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_house_item._in_home_view.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/Features/navbar/presentation/widgets/_build_Empty_State.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';
import '../../../home/data/models/house_model.dart';

class FavoriteProductsView extends StatefulWidget {
  @override
  State<FavoriteProductsView> createState() => _FavoriteProductsViewState();
}

class _FavoriteProductsViewState extends State<FavoriteProductsView> {
  @override
  void initState() {
    BlocProvider.of<GethouseCubit>(context).getFavoriteData(token: userToken!);
    super.initState();
  }

  List<HouseModel> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "قائمه المفضله",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<GethouseCubit, GethouseState>(
          builder: (context, state) {
            if (state is IsSuccessGetHouseFavorite) {
              data = state.data;
              return _buildListView();
            } else if (state is IsDataIsEmptyFavorite) {
              return CustomIsFavoretIsEmpty();
            } else {
              return Center(child: Lottie.asset(AppAssets.Loding1));
            }
          },
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CustomhouseItem(
          data: data[index],
        );
      },
    );
  }
}
