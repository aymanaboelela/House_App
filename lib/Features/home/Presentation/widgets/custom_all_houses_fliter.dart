import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_filter_gender.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';

class AllHousesFltier extends StatelessWidget {
  const AllHousesFltier({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => BlocProvider.of<GethouseCubit>(context).getData(),
        child: CustomFilterSelect(title: "كل العقارات"));
  }
}
