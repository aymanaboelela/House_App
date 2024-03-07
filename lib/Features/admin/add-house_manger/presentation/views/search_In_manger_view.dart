import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/get_house_manger/get_house_manger_cubit.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/models/get_house_mangers_model/get_house_mangers_model.dart';
import 'package:house_app_one/Features/admin/add-house_manger/presentation/views/widgets/custom_house_manger_Item.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import '../../../../../../core/utils/responsive.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class SearchInHouseMangerView extends StatefulWidget {
  const SearchInHouseMangerView({super.key, this.idHouse});
  final String? idHouse;
  @override
  State<SearchInHouseMangerView> createState() =>
      _SearchInHouseMangerViewState();
}

class _SearchInHouseMangerViewState extends State<SearchInHouseMangerView> {
  @override
  void initState() {
    BlocProvider.of<GetHouseMangerCubit>(context).getData();
    _controller.text = widget.idHouse ?? "";

    super.initState();
  }

  TextEditingController _controller = TextEditingController();

  Timer? _debounceTimer;

  String? idresalt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFormFieldSearch(
          controller: _controller,
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
      endDrawer: buildSideDrawer(),
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

  Widget buildSideDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  "عدد اصحاب العقارات ",
                  style: GoogleFonts.cairo(),
                ),
                SizeVertical(value: 1),
                Text(
                  "${BlocProvider.of<GetHouseMangerCubit>(context).data.length}",
                  style: GoogleFonts.cairo(),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              "البحث عن عقار",
              style: GoogleFonts.cairo(),
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.KSearchInHouse);
            },
          ),
        ],
      ),
    );
  }
}
