import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';

import '../../../home/Presentation/widgets/costom_prodact.dart';

import '../../../home/data/cubit/favorite/favorite_cubit.dart';
import '../../../home/data/models/house_model.dart';

class FavoriteProductsView extends StatelessWidget {
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
        child: FavoriteProducts.products.isEmpty
            ? Center(
                child: Column(
                  children: [
                    Lottie.asset(AppAssets.favorite),
                    Text(
                      "قم باضافه شقه الي المفضله",
                      style: GoogleFonts.cairo(fontSize: 25),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: FavoriteProducts.products.length,
                itemBuilder: (context, index) {
                  HouseModel data = FavoriteProducts.products[index];
                  return CustomProduct(
                    data: data,
                  );
                },
              ),
      ),
    );
  }
}
