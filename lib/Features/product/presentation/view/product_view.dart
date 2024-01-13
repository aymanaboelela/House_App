import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';
import '../widgets/Custom_product_details.dart';
import '../widgets/custum_product_coll.dart';
import '../widgets/custom_product_details2.dart';
import '../widgets/customproductdescription.dart';
import '../widgets/custom_ProductItem.dart';

class ProductView extends StatefulWidget {
  ProductView({super.key});
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;
  @override
  void initState() {
    super.initState();
    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _favoriteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (_favoriteController.status == AnimationStatus.dismissed) {
                _favoriteController.reset();
                _favoriteController.animateTo(0.6);
              } else {
                _favoriteController.reverse();
              }
              setState(() {});
            },
            icon: Lottie.asset(Icons8.heart_color,
                height: SizeConfig.defaultSize! * 3.2,
                controller: _favoriteController),
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
              CoustomProductDescription.CustomProductDescription(),
              SizeVertical(value: 2.2),
              CustomProductCall(),
              SizeVertical(value: 2.2),
            ],
          ),
        ),
      ),
    );
  }
}
