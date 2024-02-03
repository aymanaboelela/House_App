import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: ListView.builder(
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
