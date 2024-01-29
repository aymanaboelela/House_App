import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive.dart';
import '../../data/cubit/favoret/favoret_cubit.dart';
import '../../data/models/house_model.dart';

class FavoretIconItem extends StatelessWidget {
  const  FavoretIconItem({super.key, required this.data});
  final HouseModel data;
  @override
  Widget build(BuildContext context) {
    bool isFavorite = BlocProvider.of<FavoretCubit>(context).isFavorite;

    return BlocBuilder<FavoretCubit, FavoretState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<FavoretCubit>(context)
                .addProductInFavoretView(data);
            BlocProvider.of<FavoretCubit>(context).setData();
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
