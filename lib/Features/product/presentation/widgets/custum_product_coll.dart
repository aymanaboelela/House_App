import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/cool_item.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import '../../../../core/utils/responsive.dart';
class CustomProductCall extends StatelessWidget {
  const CustomProductCall({
    super.key,
    required this.data,
  });
  final HouseModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 15,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "التواصل",
              style: GoogleFonts.cairo(fontSize: 22),
            ),
            const SizeVertical(value: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CollItem(data: data)],
            ),
          ],
        ),
      ),
    );
  }
}
