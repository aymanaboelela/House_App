import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_client/data/cubits/get_client/get_client_cubit.dart';
import 'package:house_app_one/Features/admin/add_client/data/models/client_model.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/widgets/custom_client_item.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/widgets/custom_drawer_in_client.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';

import '../../../../../../core/utils/responsive.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class SearchClientView extends StatefulWidget {
  const SearchClientView({super.key, this.idHouse});
  final String? idHouse;
  @override
  State<SearchClientView> createState() => _SearchClientViewState();
}

class _SearchClientViewState extends State<SearchClientView> {
  Timer? _debounceTimer;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.text = widget.idHouse ?? "";
    super.initState();
  }

  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

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
              BlocProvider.of<GetClientCubit>(context).searchClientById(value);
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            BlocBuilder<GetClientCubit, GetClientState>(
              builder: (context, state) {
                if (state is IsLodingGetClient) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is IsSucssesGetClient) {
                  return buildResults(state.data);
                } else if (state is IsFeilerGetClient) {
                  return Center(
                    child: Text(
                      'خطاء : لايوجل مستاجر بهذا iD ',
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
      endDrawer: CustomDrawerInClient(),
    );
  }

  Widget buildResults(List<clientModel> data) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CustomClientItem(data: data[index]);
        },
      ),
    );
  }

  Widget SearchNow() {
    return Column(
      children: [
        Icon(Icons.search),
        SizeVertical(value: 2),
        Center(child: Text("قم بالبحث ")),
      ],
    );
  }
}
