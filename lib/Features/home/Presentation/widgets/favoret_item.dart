import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive.dart';
import '../../data/cubit/favorite/favorite_cubit.dart';
import '../../data/models/house_model.dart';

class FavoretIconItem extends StatelessWidget {
  const FavoretIconItem({super.key, required this.data});
  final HouseModel data;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoretState>(
      builder: (context, state) {
        bool isFavorite = BlocProvider.of<FavoriteCubit>(context).isFavorite;
        return IconButton(
          onPressed: () {
            BlocProvider.of<FavoriteCubit>(context)
                .addProductInFavoriteView(data);
            BlocProvider.of<FavoriteCubit>(context).setData();
          },
          icon: isFavorite
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: SizeConfig.defaultSize! * 3.5,
                )
              : Icon(
                  Icons.favorite_border,
                  size: SizeConfig.defaultSize! * 3,
                ),
        );
      },
    );
  }
}
