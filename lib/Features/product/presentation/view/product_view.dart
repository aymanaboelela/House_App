import 'package:flutter/material.dart';
import 'package:house_app_one/Features/product/presentation/widgets/custom_product_location.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import '../../../home/data/models/house_model.dart';
import '../widgets/custom_house_Item.dart';
import '../widgets/custom_product_details.dart';
import '../widgets/custum_product_coll.dart';
import '../widgets/custom_product_details2.dart';
import '../widgets/customproductdescription.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.data}) : super(key: key);
  final HouseModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Scaffold(
        appBar: AppBar(
          actions: [Image.asset(AppAssets.logo)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CoustomProductItem(
                data: data,
              ),
              const SizeVertical(value: 2.2),
              CustomProductDetails(
                  gender: data.gender,
                  numberOfBeds: data.numpersOfBad,
                  numberOfRooms: data.numpersOfRoms,
                  typeHouse: data.typeHouse),
              const SizeVertical(value: 2.2),
              CustomProductDetailsFeatures(
                data: data,
              ),
              const SizeVertical(value: 2.2),
           CustomProductLocation(),
              const SizeVertical(value: 2.2),
              CoustomProductDescription(
                description: data.description,
              ),
              const SizeVertical(value: 2.2),
              CustomProductCall(
                data: data,
              ),
              const SizeVertical(value: 2.2),
            ],
          ),
        ),
      ),
    );
  }
}
