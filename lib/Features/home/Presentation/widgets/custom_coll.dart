import 'package:flutter/material.dart';

class CustomColl extends StatelessWidget {
  const CustomColl({
    super.key,
    required this.onTap,
    required this.icon, required this.color,
  });
  final void Function()? onTap;
  final  Color? color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 43,
        height: 42,
        decoration: ShapeDecoration(
          color: color,
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
