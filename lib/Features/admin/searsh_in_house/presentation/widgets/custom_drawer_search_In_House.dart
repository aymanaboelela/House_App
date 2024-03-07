import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';

class CustomDrawerSearchInHouse extends StatelessWidget {
  const CustomDrawerSearchInHouse({super.key});

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
                  "عدد الشقق في التطبيق",
                  style: GoogleFonts.cairo(),
                ),
                SizeVertical(value: 1),
                Text(
                  "${BlocProvider.of<GethouseCubit>(context).data.length}",
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