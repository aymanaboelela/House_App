import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_data_is_empty.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_house_item._in_home_view.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:lottie/lottie.dart';

class CustomHousesItemsListView extends StatelessWidget {
  const CustomHousesItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GethouseCubit, GethouseState>(
      listener: (context, state) {
        if (state is IsFailureGetHouse) {
          CustomError.error(
            context,
            dialogType: DialogType.error,
            title: "فشل",
            desc: "فشلت جلب العقارات",
          );
        }
        if (state is IsDataIsEmptyGetHouse) {
          CustomError.error(
            context,
            dialogType: DialogType.info,
            title: "مشكله",
            desc: "لايوجد عقار بهذا الوصف حاول في وقت اخر",
          );
        }
      },
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (state is IsLodingGetHouse) {
                return Lottie.asset(AppAssets.Loding1);
              } else if (state is IsSuccessGetHouse) {
                final data = state.data;
                return data.isEmpty
                    ? CustomDataIsEmpty()
                    : CustomhouseItem(data: data[index]);
              }
              return CustomDataIsEmpty();
            },
            childCount: state is IsSuccessGetHouse ? state.data.length : 1,
          ),
        );
      },
    );
  }
}
