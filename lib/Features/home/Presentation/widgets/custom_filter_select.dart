import 'package:flutter/material.dart';
import 'package:house_app_one/Features/home/data/models/fliters_modes.dart';
import '../../../../core/utils/responsive.dart';

class CustomFilterSelect extends StatelessWidget {
  const CustomFilterSelect({
    super.key,
    required this.title,
    required this.isSelect,
  });
  final FlitersModel title;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 4.3,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: isSelect == true ? Colors.blue : Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title.name, style: TextStyle(fontFamily: "Cairo", fontSize: 13)),
            const SizeHorizontal(value: 0.9),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
