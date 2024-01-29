import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/favoret_item.dart';
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
        actions: [FavoretIconItem(data: widget.data)],
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
              CustomProductCall(
                data: widget.data,
              ),
              const SizeVertical(value: 2.2),
            ],
          ),
        ),
      ),
    );
  }
}
