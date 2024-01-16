import 'package:flutter/material.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import '../../../home/data/shered_preferences/shared_preferences.dart';
import '../widgets/Custom_product_details.dart';
import '../widgets/custum_product_coll.dart';
import '../widgets/custom_product_details2.dart';
import '../widgets/customproductdescription.dart';
import '../widgets/custom_ProductItem.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isfavorite = false;

  void initState() {
    super.initState();
    initFavoriteState();
  }

  Future<void> initFavoriteState() async {
    // Initialize shared preferences before using it
    await CacheData.cacheDataInit();

    // Retrieve the favorite state from shared preferences
    bool cachedFavorite = CacheData.getdata(key: "isfavoretandtetels") ?? true;

    // Update the state only if the widget is still mounted
    if (mounted) {
      setState(() {
        isfavorite = cachedFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              // Save the updated favorite state to shared preferences
              await CacheData.setData(
                key: "isfavoretandtetels",
                value: !isfavorite,
              );

              setState(() {
                isfavorite = !isfavorite;
              });
            },
            icon: isfavorite
                ? Icon(
                    Icons.favorite,
                    size: SizeConfig.defaultSize! * 3.5,
                  )
                : Icon(Icons.favorite_border,
                    size: SizeConfig.defaultSize! * 3),
            color: isfavorite ? Colors.red : Colors.grey,
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
  }
}
