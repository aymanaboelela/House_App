import 'package:flutter/material.dart';

class CustomDataIsEmpty extends StatelessWidget {
  const CustomDataIsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "هناك مشكله برجاء المحاوله في وقت لاحق",
        style: TextStyle(fontFamily: "Cairo"),
      ),
    );
  }
}