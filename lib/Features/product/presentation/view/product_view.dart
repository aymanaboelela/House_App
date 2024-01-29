import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/data/cubit/favoret/favoret_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import '../../../home/data/models/house_model.dart';
import '../widgets/custom_ProductItem.dart';
import '../widgets/custom_product_details.dart';
import '../widgets/custum_product_coll.dart';
import '../widgets/custom_product_details2.dart';
import '../widgets/customproductdescription.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key, required this.data}) : super(key: key);
  final HouseModel data;
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //   onPressed: () {
          //     // BlocProvider.of<FavoretCubit>(context).setData( );
          //   },
          //   icon: BlocProvider.of<FavoretCubit>(context).isfavorite
          //       ? Icon(
          //           Icons.favorite,
          //           size: SizeConfig.defaultSize! * 3.5,
          //         )
          //       : Icon(Icons.favorite_border,
          //           size: SizeConfig.defaultSize! * 3),
          //   color: BlocProvider.of<FavoretCubit>(context).isfavorite
          //       ? Colors.red
          //       : Colors.grey,
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoustomProductItem(
                data: widget.data,
              ),
              const SizeVertical(value: 2.2),
              CustomProductDetails(
                  gender: widget.data.gender,
                  numberOfBeds: widget.data.numpersOfBad,
                  numberOfRooms: widget.data.numpersOfRoms,
                  typeHouse: widget.data.typeHouse),
              const SizeVertical(value: 2.2),
              CustomProductDetails2(
                  isWiFi: widget.data.wifi,
                  isAirConditioner: widget.data.airConditioner,
                  isNaturalgas: widget.data.naturalgas),
              const SizeVertical(value: 2.2),
              CoustomProductDescription(
                description: widget.data.description,
              ),
              const SizeVertical(value: 2.2),
              const CustomProductCall(),
              const SizeVertical(value: 2.2),
            ],
          ),
        ),
      ),
    );
  }
}
