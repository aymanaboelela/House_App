
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/color.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    this.onTap,
    required this.name,
    required this.lastMessage,
    required this.time,
  });

  final void Function()? onTap;

  final String name;
  final String lastMessage;
  final String time;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: SizeConfig.defaultSize! * 10,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: MyColors.darkGrey2,
            border: Border.symmetric(
              horizontal: BorderSide(width: 2, color: MyColors.black),
            ),
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: SizeConfig.defaultSize! * 4,
                backgroundColor: MyColors.darkGrey,
                backgroundImage: AssetImage(
                  AppAssets.userImage,
                ),
              ),
              Positioned(
                right: SizeConfig.defaultSize! * 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(fontSize: 20),
                    ),
                    SizeVertical(value: 1),
                    Text(lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          fontSize: SizeConfig.defaultSize! * 1.6,
                          color: MyColors.lightGrey,
                        )),
                  ],
                ),
              ),
              Positioned(
                bottom: 2,
                left: 3,
                child: Text(
                  formattedTime,
                  style: GoogleFonts.cairo(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
