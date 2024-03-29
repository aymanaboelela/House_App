import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/app_route.dart';

class CustomPopupMenuWhithUnverstyLocation extends StatelessWidget {
  const CustomPopupMenuWhithUnverstyLocation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _showPopupMenu(context);
      },
      icon: Icon(Icons.keyboard_arrow_down_outlined),
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
            "تغير الموقع",
            style: GoogleFonts.cairo(),
          ),
          onTap: () =>
              GoRouter.of(context).push(AppRouter.KLocationInuniversityView),
          value: 1,
        ),
      ],
      elevation: 8.0,
    );
  }
}
