import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/thems/app/app_colors.dart';
import 'package:house_app_one/core/utils/assets.dart';

import 'package:intl/intl.dart';

class ChatBubbleForCurrentUser extends StatelessWidget {
  const ChatBubbleForCurrentUser({
    Key? key,
    required this.message,
    required this.time,
    required this.isAdmain,
  }) : super(key: key);
  final String time;
  final String message;
  final bool isAdmain;
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.black,
              backgroundImage: isAdmain
                  ? AssetImage(AppAssets.logo)
                  : AssetImage(AppAssets.userImage),
            ),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 13, top: 10, bottom: 25, right: 42),
                margin: const EdgeInsets.only(
                    left: 25, top: 2, bottom: 16, right: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: AppColors.darkGrey2,
                ),
                child: Text(message,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      color: AppColors.white,
                    )),
              ),
              Positioned(
                right: 30,
                bottom: 20,
                child: Text(formattedTime),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    Key? key,
    required this.message,
    required this.time,
    required this.isAdmain,
  }) : super(key: key);

  final String message;
  final bool isAdmain;
  final String time;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.black,
              backgroundImage: isAdmain
                  ? AssetImage(AppAssets.logo)
                  : AssetImage(AppAssets.userImage),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 43, top: 10, bottom: 27, right: 10),
                  margin: const EdgeInsets.only(
                    top: 7,
                    right: 28,
                    bottom: 20,
                  ),
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
                Positioned(
                  left: 15,
                  bottom: 25,
                  child: Text(formattedTime),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
