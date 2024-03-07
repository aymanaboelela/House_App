import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_client/data/cubits/get_client/get_client_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class CustomDrawerInClient extends StatelessWidget {
  const CustomDrawerInClient({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "عدد المستاجرين",
                  style: GoogleFonts.cairo(),
                ),
                SizeVertical(value: 1),
                Text(
                  "${BlocProvider.of<GetClientCubit>(context).data.length}",
                  style: GoogleFonts.cairo(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
