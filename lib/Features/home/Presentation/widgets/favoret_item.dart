
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/costom_prodact.dart';

import '../../../../core/utils/responsive.dart';
import '../../data/cubit/favoret/favoret_cubit.dart';
import '../../data/models/house_model.dart';

class FavoretItem extends StatefulWidget {
  const FavoretItem({super.key, required this.data});
  final HouseModel data;

  @override
  State<FavoretItem> createState() => _FavoretItemState();
}

class _FavoretItemState extends State<FavoretItem> {
  
  @override
  Widget build(BuildContext context) {
    bool isFavorite = FavoriteProducts.products.contains(widget.data);
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // Remove from favorites
          FavoriteProducts.products.remove(widget.data);
        } else {
          // Add to favorites
          FavoriteProducts.products.add(widget.data);
        }
        isFavorite = !isFavorite;
        // Trigger a rebuild
        BlocProvider.of<FavoretCubit>(context).setData(isFavorite);
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
  }
}

