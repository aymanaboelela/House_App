import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({super.key, required this.title, required this.selectedTitle});
  final String title;
  final Function(bool) selectedTitle;
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: GoogleFonts.cairo(),
      ),
      value: isChecked,
      onChanged: (value) {
        
        setState(() {
          isChecked = value!;
        });
        widget.selectedTitle(isChecked);
      },
    );
  }
}
