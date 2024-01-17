import 'package:flutter/material.dart';

class CustomSelectNumperOfBad extends StatefulWidget {
  const CustomSelectNumperOfBad({Key? key}) : super(key: key);

  @override
  State<CustomSelectNumperOfBad> createState() =>
      _CustomSelectNumperOfBadState();
}

class _CustomSelectNumperOfBadState extends State<CustomSelectNumperOfBad> {
  List<String> numbers = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];
  String selectedNumber = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          for (int i = 0; i < numbers.length; i++)
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  value: numbers[i],
                  groupValue: selectedNumber,
                  onChanged: (value) {
                    setState(() {
                      selectedNumber = value.toString();
                    });
                  },
                ),
                Text(numbers[i]),
              ],
            ),
        ],
      ),
    );
  }
}
