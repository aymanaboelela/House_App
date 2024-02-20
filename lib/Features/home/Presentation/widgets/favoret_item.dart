import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import '../../../../core/utils/responsive.dart';
import '../../data/cubit/favorite/favorite_cubit.dart';
import '../../data/models/house_model.dart';

class FavoretIconItem extends StatefulWidget {
  const FavoretIconItem({super.key, required this.data, });
  final HouseModel data;
 
  @override
  State<FavoretIconItem> createState() => _FavoretIconItemState();
}

class _FavoretIconItemState extends State<FavoretIconItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = CacheData.getdata(key: widget.data.id) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoretState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            isFavorite = !isFavorite;
            await BlocProvider.of<FavoriteCubit>(context)
                .addProductInFavoriteView(widget.data, isFavorite,);
            setState(() {});
          },
          icon: Icon(
            // استخدام شرط تكراري لتحديد أيقونة القلب
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
            size: SizeConfig.defaultSize! * (isFavorite ? 3.5 : 3),
          ),
        );
      },
    );
  }
}
