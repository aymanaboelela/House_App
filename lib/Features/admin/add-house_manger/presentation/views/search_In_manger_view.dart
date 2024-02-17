import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/get_house_manger/get_house_manger_cubit.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/models/get_house_mangers_model/get_house_mangers_model.dart';
import 'package:house_app_one/Features/admin/add-house_manger/presentation/views/widgets/custom_house_manger_Item.dart';

import '../../../../../../core/utils/responsive.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class SearchInMangerView extends StatefulWidget {
  const SearchInMangerView({super.key});

  @override
  State<SearchInMangerView> createState() => _SearchInMangerViewState();
}

class _SearchInMangerViewState extends State<SearchInMangerView> {
  Timer? _debounceTimer;
  void dispose() {
    // _debounceTimer?.cancel();

    super.dispose();
  }

  String? idresalt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(
              '${BlocProvider.of<GetHouseMangerCubit>(context).data.length}'),
        ),
        title: CustomTextFormFieldSearch(
          icon: Icons.search,
          onChanged: (value) {
            idresalt = value;
            _debounceTimer?.cancel();
            _debounceTimer = Timer(Duration(milliseconds: 500), () {
              BlocProvider.of<GetHouseMangerCubit>(context)
                  .searchHouseMangerById(value);
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<GetHouseMangerCubit, GetHouseMangerState>(
              builder: (context, state) {
                if (state is IsLodingGetHouseManger) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is IsSucssesGetHouseMager) {
                  return buildResults(state.data);
                } else if (state is IsFeilerGetHouseManger) {
                  return Center(
                    child: Text(
                      'خطاء: لايوجل  صاحب شقه بهذا iD ',
                      style: GoogleFonts.cairo(fontSize: 20),
                    ),
                  );
                } else {
                  return SearchNow();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResults(List<HouseMangerModel> data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CustomHouseMangerItem(data: data[index]);
        },
      ),
    );
  }

  Widget SearchNow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.search),
        SizeVertical(value: 2),
        Center(child: Text("قم بالبحث ")),
      ],
    );
  }
}
