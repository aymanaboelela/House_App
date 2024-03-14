import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_app_one/Features/home/data/cubit/filters/filters_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';

Future<void> refreshData(BuildContext context) {
  if (BlocProvider.of<FiltersCubit>(context).isFemaleSelected == true) {
    return BlocProvider.of<GethouseCubit>(context).getDataGender("بنات");
  } else if (BlocProvider.of<FiltersCubit>(context).isMaleSelected == true) {
    return BlocProvider.of<GethouseCubit>(context).getDataGender("شباب");
  } else if (BlocProvider.of<FiltersCubit>(context).ishouseSelected == true) {
    return BlocProvider.of<GethouseCubit>(context).getDataTypHouse("شقه");
  } else if (BlocProvider.of<FiltersCubit>(context).isStudioelected == true) {
    return BlocProvider.of<GethouseCubit>(context).getDataTypHouse("استيديو");
  } else {
    return BlocProvider.of<GethouseCubit>(context).getData();
  }
}
