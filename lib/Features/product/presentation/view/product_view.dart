import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/favoret_item.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import '../../../home/data/models/house_model.dart';
import '../widgets/custom_ProductItem.dart';
import '../widgets/custom_product_details.dart';
import '../widgets/custum_product_coll.dart';
import '../widgets/custom_product_details2.dart';
import '../widgets/customproductdescription.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.data}) : super(key: key);
  final HouseModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // actions: [FavoretIconItem(data: data)],
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: SingleChildScrollView(
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
              CustomProductDetails2(
                  isWiFi: data.wifi,
                  isAirConditioner: data.airConditioner,
                  isNaturalgas: data.naturalgas),
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
