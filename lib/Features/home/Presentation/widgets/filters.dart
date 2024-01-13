import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/Custom_select_gender.dart';

import '../../../../core/utils/responsive.dart';

class CustomFilters extends StatelessWidget {
  const CustomFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) {
            return Stack(children: [
              Container(
                height: SizeConfig.defaultSize! * 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white12,
                ),
                child: Column(
                  children: [
                    const SizeVertical(value: 2),
                    Text(
                      "نوع المستاجر",
                      style: GoogleFonts.cairo(fontSize: 20),
                    ),
                    const SizeVertical(value: 1),
                    const Divider(
                      endIndent: 30,
                      indent: 30,
                      height: 15,
                      color: Colors.white38,
                    ),
                    const SizeVertical(value: 1),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSelectGender(
                            genger: "شباب",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const SizeHorizontal(value: 2),
                          CustomSelectGender(
                            genger: "بنات",
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_outlined)),
              )
            ]);
          },
        );
      },
      child: Container(
        height: SizeConfig.defaultSize! * 4,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "النوع",
                style: GoogleFonts.cairo(fontSize: 12),
              ),
              const SizeHorizontal(value: 0.9),
              const Icon(
                Icons.keyboard_arrow_down_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}

