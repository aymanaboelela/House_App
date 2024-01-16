import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/data/cubit/favoret/favoret_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';

import '../widgets/Custom_product_details.dart';
import '../widgets/custum_product_coll.dart';
import '../widgets/custom_product_details2.dart';
import '../widgets/customproductdescription.dart';
import '../widgets/custom_ProductItem.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoretCubit, FavoretState>(
      listener: (context, state) {
        if (state is FavoretCach) {
          BlocProvider.of<FavoretCubit>(context).getData();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: ()  {
                   BlocProvider.of<FavoretCubit>(context).setData();
                },
                icon: BlocProvider.of<FavoretCubit>(context).isfavorite
                    ? Icon(
                        Icons.favorite,
                        size: SizeConfig.defaultSize! * 3.5,
                      )
                    : Icon(Icons.favorite_border,
                        size: SizeConfig.defaultSize! * 3),
                color: BlocProvider.of<FavoretCubit>(context).isfavorite
                    ? Colors.red
                    : Colors.grey,
              ),
            ],
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 9),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CoustomProductItem(),
                  SizeVertical(value: 2.2),
                  CustomProductDetails(),
                  SizeVertical(value: 2.2),
                  CustomProductDetails2(),
                  SizeVertical(value: 2.2),
                  CoustomProductDescription(),
                  SizeVertical(value: 2.2),
                  CustomProductCall(),
                  SizeVertical(value: 2.2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
