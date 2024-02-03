import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive.dart';
import '../../data/cubit/favorite/favorite_cubit.dart';
import '../../data/models/house_model.dart';

class FavoretIconItem extends StatefulWidget {
  const FavoretIconItem({super.key, required this.data});
  final HouseModel data;

  @override
  State<FavoretIconItem> createState() => _FavoretIconItemState();
}

class _FavoretIconItemState extends State<FavoretIconItem> {
  @override
  void initState() {
    BlocProvider.of<FavoriteCubit>(context).getData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoretState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<FavoriteCubit>(context)
                .addProductInFavoriteView(widget.data);
            BlocProvider.of<FavoriteCubit>(context).setData();
          },
          icon: BlocProvider.of<FavoriteCubit>(context).isFavorite
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
