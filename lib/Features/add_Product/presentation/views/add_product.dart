import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_buttons.dart';
import '../widgets/custom_check_bok.dart';
import '../widgets/custom_select_numper_ofBad.dart';
import '../widgets/custom_toggle_button.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String gender = 'ذكر';
  bool isMaleSelected = true;
  bool isFemaleSelected = false;

  bool isapartmentSelected = true;
  bool isStudioSelected = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "إضافة شقة",
          style: GoogleFonts.cairo(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "نوع العقار  :",
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                    ),
                  ),
                  const SizeVertical(value: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomToggleButton(
                        label: "شقه  ",
                        isSelected: isapartmentSelected,
                        onToggle: () {
                          setState(() {
                            isapartmentSelected = !isapartmentSelected;
                            isStudioSelected = !isStudioSelected;
                          });
                        },
                      ),
                      const SizeHorizontal(value: 1),
                      CustomToggleButton(
                        label: "استيديو",
                        isSelected: isStudioSelected,
                        onToggle: () {
                          setState(
                            () {
                              isStudioSelected = !isStudioSelected;
                              isapartmentSelected = !isapartmentSelected;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizeVertical(value: 2),
                  Text(
                    "شقه :",
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                    ),
                  ),
                  const SizeVertical(value: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomToggleButton(
                        label: "شباب ",
                        isSelected: isMaleSelected,
                        onToggle: () {
                          setState(() {
                            isMaleSelected = !isMaleSelected;
                            isFemaleSelected = !isMaleSelected;
                          });
                        },
                      ),
                      const SizeHorizontal(value: 1),
                      CustomToggleButton(
                        label: "بنات",
                        isSelected: isFemaleSelected,
                        onToggle: () {
                          setState(
                            () {
                              isFemaleSelected = !isFemaleSelected;
                              isMaleSelected = !isFemaleSelected;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizeVertical(value: 2),
                  Text(
                    "عدد الغرف :",
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                    ),
                  ),
                  const CustomSelectNumperOfBad(),
                  const SizeVertical(value: 2),
                  Text(
                    "عدد السرائر :",
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                    ),
                  ),
                  const CustomSelectNumperOfBad(),
                  const SizeVertical(value: 2),
                  Text(
                    "مميزات الشقه :",
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                    ),
                  ),
                  CustomCheckbox(title: "مكيفه"),
                  CustomCheckbox(title: "Wi-Fi"),
                  CustomCheckbox(title: "غاز طبيعي"),
                  const SizeVertical(value: 2),
                  const CustomTextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    title: "سعر السرير:",
                    hintText: "سعر السرير",
                    icon: FontAwesomeIcons.moneyBill,
                  ),
                  const SizeVertical(value: 2),
                  const CustomTextFormField(
                    title: "وصف الشقة:",
                    hintText: "وصف الشقة",
                    icon: FontAwesomeIcons.houseChimney,
                  ),
                  const SizeVertical(value: 2),
                  Text(
                    "اضافه صور :",
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                    ),
                  ),
                  const SizeVertical(value: 2),
                  IconButton(
                      onPressed: pickImage,
                      icon: const Icon(FontAwesomeIcons.photoFilm)),
                  const SizeVertical(value: 2),
                  CustomGeneralButton(
                    text: "اضف الشقه",
                    onTap: () {},
                  ),
                  const SizeVertical(value: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
    void pickImage() async {
     await ImagePicker().pickImage  (source: ImageSource.gallery);

    setState(() {
   
    });
  }
}
