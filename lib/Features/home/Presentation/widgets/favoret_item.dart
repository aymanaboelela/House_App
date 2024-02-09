import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/cubit/favorite/favorite_cubit.dart';
import '../../data/models/house_model.dart';

class FavoretIconItem extends StatefulWidget {
  const FavoretIconItem({super.key, required this.data, required this.index});
  final HouseModel data;
  final int index;
  @override
  State<FavoretIconItem> createState() => _FavoretIconItemState();
}

class _FavoretIconItemState extends State<FavoretIconItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteCubit>(context).getData(widget.index).then((_) {
      isFavorite = CacheData.getdata(key: widget.index.toString()) ?? false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoretState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            isFavorite = !isFavorite;
            await BlocProvider.of<FavoriteCubit>(context)
                .addProductInFavoriteView(
                    widget.data, isFavorite, widget.index);
            // CacheData.clearData(clearData: true);
            setState(() {});
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
