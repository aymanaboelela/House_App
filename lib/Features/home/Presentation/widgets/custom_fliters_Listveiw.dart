import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/bottom_sheates/custom_bottme_sheates.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_filter_select.dart';
import 'package:house_app_one/Features/home/data/models/fliters_modes.dart';

class CustomFlitersListView extends StatefulWidget {
  const CustomFlitersListView({super.key});

  @override
  State<CustomFlitersListView> createState() => _CustomFlitersListViewState();
}

class _CustomFlitersListViewState extends State<CustomFlitersListView> {
  List<FlitersModel> fliters(BuildContext context) => [
        FlitersModel(
          name: "كل العقارات",
          onTap: () => bottomSheetInAllHouses(context),
        ),
        FlitersModel(
          name: "نوع المستاجر",
          onTap: () => bottomSheateIsGenger(context),
        ),
        FlitersModel(
          name: "نوع العقار",
          onTap: () => bottomSheettyphouse(context),
        ),
      ];

  int selectFilter = 0;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 46,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: fliters(context).length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                onTap: () {
                  fliters(context)[index].onTap();
                  if (selectFilter != index) {
                    setState(() {
                      selectFilter = index;
                    });
                  }
                },
                child: CustomFilterSelect(
                    title: fliters(context)[index],
                    isSelect: selectFilter == index),
              ),
            );
          },
        ),
      ),
    );
  }
}