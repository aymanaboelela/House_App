import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/chat/presentation/widgets/color.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';

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
          child: Row(
            children: [
              CircleAvatar(
                radius: SizeConfig.defaultSize! * 4,
                backgroundColor: MyColors.darkGrey,
                backgroundImage: AssetImage(
                  AppAssets.userImage,
                ),
              ),
              SizeHorizontal(value: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                  SizeVertical(value: 1),
                  Text(
                    lastMessage,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 1,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
