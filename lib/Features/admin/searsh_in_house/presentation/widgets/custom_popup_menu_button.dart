import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add-house_manger/presentation/views/search_In_manger_view.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/views/search_in_client.dart';
import 'package:house_app_one/Features/admin/add_house/presentation/views/edit_house.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
class CustomPopupMenuButton extends StatelessWidget {
  final int index;
  final HouseModel data;

  const CustomPopupMenuButton({
    super.key,
    required this.index,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showPopupMenu(context);
      },
      icon: Icon(Icons.more_vert_rounded),
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset position = button
        .localToGlobal(Offset(0, button.size.height + 10), ancestor: overlay);
    final Offset offsetFromTop = Offset(0, 10);

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        position & button.size,
        offsetFromTop & overlay.size,
      ),
      items: [
        PopupMenuItem(
          child: Text(
            'تعديل ',
            style: GoogleFonts.cairo(),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditHouseView(
                index: index,
              ),
            ),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: Text(
            'حذف الشقه',
            style: GoogleFonts.cairo(),
          ),
          value: 2,
          onTap: () {
            CustomError.error(
              context,
              dialogType: DialogType.info,
              title: "حذف",
              desc: " هل تريد الحذف العقار",
              btnOkOnPress: () {
                BlocProvider.of<GethouseCubit>(context).deleteHouse(index);
                BlocProvider.of<GethouseCubit>(context).getData();
              },
              btnCancelOnPress: () {},
            );
          },
        ),
        PopupMenuItem(
          child: Text(
            'صاحب العقار ',
            style: GoogleFonts.cairo(),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchInHouseMangerView(
                    idHouse: data.idHouse,
                  );
                },
              ),
            );
          },
        ),
        PopupMenuItem(
          child: Text(
            "المستاجرين",
            style: GoogleFonts.cairo(),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchClientView(
                    idHouse: data.idHouse,
                  );
                },
              ),
            );
          },
        ),
      ],
      elevation: 8.0,
    );
  }
}
