import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/color.dart';
import 'package:house_app_one/core/utils/assets.dart';

import 'package:intl/intl.dart';

class ChatBubbleForCurrentUser extends StatelessWidget {
  const ChatBubbleForCurrentUser({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 10),
        margin: const EdgeInsets.only(left: 16, top: 8, bottom: 16, right: 100),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          color: MyColors.darkGrey2,
        ),
        child: Text(
          message,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            color: MyColors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    Key? key,
    required this.message,
    required this.time,
  }) : super(key: key);

  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            padding:
                const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 10),
            margin: const EdgeInsets.only(top: 18, right: 11),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Color.fromARGB(255, 40, 47, 121),
            ),
            child: Text(
              message,
              style: GoogleFonts.cairo(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
