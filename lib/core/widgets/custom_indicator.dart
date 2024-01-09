
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key,@required this.dotIndex}) : super(key: key);
  final int? dotIndex;
  
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          color: Colors.transparent,
          activeColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.cyan),
          )),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}
