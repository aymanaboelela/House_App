import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_house_item._in_home_view.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';
import '../../../home/data/cubit/favorite/favorite_cubit.dart';
import '../../../home/data/models/house_model.dart';

class FavoriteProductsView extends StatefulWidget {
  @override
  State<FavoriteProductsView> createState() => _FavoriteProductsViewState();
}
class _FavoriteProductsViewState extends State<FavoriteProductsView> {
  @override
  void initState() {
    setState(() {});
    BlocProvider.of<FavoriteCubit>(context).getData("VIND4TX8fKnSNi68ZV97");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المفضله',
          style: GoogleFonts.cairo(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<FavoriteCubit, FavoretState>(
          builder: (context, state) {
            if (state is GetDataState) {
              return _buildListView();
            } else {
              return _buildListView();
            }
          },
        ),
      ),
    );
  }

  Widget _buildListView() {
    return FavoriteProducts.products.isEmpty
        ? Center(
            child: Column(
              children: [
                Lottie.asset(AppAssets.favorite),
                Text(
                  "قم باضافه سكن الي المفضله",
                  style: GoogleFonts.cairo(fontSize: 25),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: FavoriteProducts.products.length,
            itemBuilder: (context, index) {
              HouseModel data = FavoriteProducts.products[index];
              // BlocProvider.of<FavoriteCubit>(context).getData();
              return CustomhouseItem(
                data: data,
              );
            },
          );
  }

  Widget _buildEmptyState() {
    return Center(
        child: Lottie.asset(
            AppAssets.Loding1) 
        );
  }
}
