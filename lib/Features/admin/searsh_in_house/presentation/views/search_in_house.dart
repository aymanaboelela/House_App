import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/searsh_in_house/presentation/widgets/custom_drawer_search_In_House.dart';
import 'package:house_app_one/Features/admin/searsh_in_house/presentation/widgets/custom_popup_menu_button.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import '../../../../home/Presentation/widgets/custom_house_item._in_home_view.dart';
import '../../../../home/data/models/house_model.dart';
class SearchInHouse extends StatefulWidget {
  const SearchInHouse({Key? key}) : super(key: key);
  @override
  State<SearchInHouse> createState() => _SearchInHouseState();
}
Timer? _debounceTimer;

class _SearchInHouseState extends State<SearchInHouse> {
  String? idresalt;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<GethouseCubit>(context).getData(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomTextFormFieldSearch(
            height: 20,
            icon: Icons.search,
            onChanged: (value) {
              idresalt = value;
              _debounceTimer?.cancel();
              _debounceTimer = Timer(Duration(milliseconds: 500), () {
                BlocProvider.of<GethouseCubit>(context).searchHouseById(value);
              });
            },
          ),
        ),
        body: Column(
          children: [
            SizeVertical(value: 2),
            BlocBuilder<GethouseCubit, GethouseState>(
              builder: (context, state) {
                if (state is IsLodingGetHouse) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is IsSucssesGetHouse) {
                  return buildResults(state.data);
                } else if (state is IsFeilerGetHouse) {
                  return Center(
                    child: Text(
                      'خطاء: لايوجل شقه بهذا iD [$idresalt]',
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
        endDrawer: CustomDrawerSearchInHouse(),
      ),
    );
  }

  Widget buildResults(List<HouseModel> data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              CustomhouseItem(
                data: data[index],
              ),
              CustomPopupMenuButton(
                data: data[index],
                index: index,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget SearchNow() {
    return Column(
      children: [
        Icon(Icons.search),
        SizeVertical(value: 2),
        Text("قم بالبحث "),
      ],
    );
  } 
}
