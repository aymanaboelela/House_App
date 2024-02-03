import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/responsive.dart';

class CustomToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onToggle;

 const CustomToggleButton({super.key, 
    required this.label,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(8.0),
      minSize: SizeConfig.defaultSize! * 6,
      color: isSelected ? Colors.blue : Colors.grey,
      onPressed: onToggle,
      child: Text(
        label,
        style: GoogleFonts.cairo(color: Colors.white),
      ),
    );
  }
}