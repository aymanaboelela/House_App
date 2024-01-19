import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/add_Product/data/cubit/add_house_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/widgets/custom_buttons.dart';
import '../widgets/custom_check_bok.dart';
import '../widgets/custom_select_numper_ofBad.dart';
import '../widgets/custom_toggle_button.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

  String gender = 'ذكر';
  String? typeHouse;
  String? genger;
  String? prise;
  String? numpersOfRome;
  String? numpersOfBad;
  String? description;
  String? airConditioner;
  String? wifi;
  String? naturalgas;
  bool isLoging = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddHouseCubit, AddHouseState>(
      listener: (context, state) {
        if (state is IsLodingAddHouse) {
          isLoging = true;
        }
        if (state is IsSucssesAddHouse) {
          isLoging = false;
          CustomError.error(context,
              dialogType: DialogType.success,
              title: "نجح",
              desc: "تم اضافه الشقه");
        }
        if (state is IsFeilerAddHouse) {
          isLoging = false;
          CustomError.error(context,
              dialogType: DialogType.error,
              title: "فشل",
              desc: "فشلت اضافه الشقه ");
          isLoging = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoging,
          child: Scaffold(
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
                              isSelected:
                                  BlocProvider.of<AddHouseCubit>(context)
                                      .isapartmentSelected,
                              onToggle: () {
                                typeHouse = "شقه";
                                BlocProvider.of<AddHouseCubit>(context)
                                    .houseSelected();
                              },
                            ),
                            const SizeHorizontal(value: 1),
                            CustomToggleButton(
                              label: "استيديو",
                              isSelected:
                                  BlocProvider.of<AddHouseCubit>(context)
                                      .isStudioSelected,
                              onToggle: () {
                                typeHouse = "استيديو";
                                BlocProvider.of<AddHouseCubit>(context)
                                    .houseSelected2();
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
                              isSelected:
                                  BlocProvider.of<AddHouseCubit>(context)
                                      .isMaleSelected,
                              onToggle: () {
                                genger = "شباب";
                                BlocProvider.of<AddHouseCubit>(context)
                                    .chingeGengerBoyes();
                              },
                            ),
                            const SizeHorizontal(value: 1),
                            CustomToggleButton(
                              label: "بنات",
                              isSelected:
                                  BlocProvider.of<AddHouseCubit>(context)
                                      .isFemaleSelected,
                              onToggle: () {
                                genger = "بنات";
                                BlocProvider.of<AddHouseCubit>(context)
                                    .chingeGengergirls();
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
                        CustomSelectNumperOfBad(
                          onNumberSelected: (value) {
                            numpersOfRome = value;
                          },
                        ),
                        const SizeVertical(value: 2),
                        Text(
                          "عدد السرائر :",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                          ),
                        ),
                        CustomSelectNumperOfBad(
                          onNumberSelected: (value) {
                            numpersOfBad = value;
                          },
                        ),
                        const SizeVertical(value: 2),
                        Text(
                          "مميزات الشقه :",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                          ),
                        ),
                        CustomCheckbox(
                          selectedTitle: (value) {
                            airConditioner = value;
                          },
                          title: "مكيفه",
                        ),
                        CustomCheckbox(
                          title: "Wi-Fi",
                          selectedTitle: (value) {
                            wifi = value;
                          },
                        ),
                        CustomCheckbox(
                            title: "غاز طبيعي",
                            selectedTitle: (value) {
                              naturalgas = value;
                            }),
                        const SizeVertical(value: 2),
                        CustomTextFormField(
                          keyboardType: const TextInputType.numberWithOptions(),
                          title: "سعر السرير:",
                          hintText: "سعر السرير",
                          icon: FontAwesomeIcons.moneyBill,
                          onChanged: (value) {
                            prise = value;
                          },
                        ),
                        const SizeVertical(value: 2),
                        CustomTextFormField(
                          title: "وصف الشقة:",
                          hintText: "وصف الشقة",
                          icon: FontAwesomeIcons.houseChimney,
                          onChanged: (value) {
                            description = value;
                          },
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
                            onPressed: BlocProvider.of<AddHouseCubit>(context)
                                .pickImage,
                            icon: const Icon(FontAwesomeIcons.photoFilm)),
                        const SizeVertical(value: 2),
                        CustomGeneralButton(
                          text: "اضف الشقه",
                          onTap: () {
                            BlocProvider.of<AddHouseCubit>(context).addHouse(
                              typeHouse: typeHouse!,
                              gender: gender,
                              numberOfRooms: numpersOfRome!,
                              numberOfBeds: numpersOfBad!,
                              airConditioner: airConditioner!,
                              wifi: wifi!,
                              naturalGas: naturalgas!,
                              prise: prise!,
                              description: description!,
                            );
                          },
                        ),
                        const SizeVertical(value: 2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
