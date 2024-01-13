import 'package:flutter/material.dart';

class CustomColl extends StatelessWidget {
  const CustomColl({
    super.key,
   required this.onTap,
    required this.icon,
  });
  final void Function()? onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 43,
        height: 42,
        decoration: ShapeDecoration(
          color: const Color(0xFF4EFF75),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
