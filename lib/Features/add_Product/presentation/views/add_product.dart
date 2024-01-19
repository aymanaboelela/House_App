import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  String? typeHouse;
  String? genger;
  String? prise;
  String? numpersOfRome;
  String? numpersOfBad;
  String? description;
  String? airConditioner;
  String? wifi;
  String? naturalgas;

  @override
  void initState() {
    addHouse();
    super.initState();
  }

  CollectionReference house = FirebaseFirestore.instance.collection('users');

  Future<void> addHouse() async {
    try {
      await house.add({
        'Type House': typeHouse,
        'Gender': genger,
        'Numpers Of Rome': numpersOfRome,
        'Numpers of bad': numpersOfBad,
        'airConditioner': airConditioner,
        'Wifi': wifi,
        'naturalgas': naturalgas,
        'Prise': prise,
        'Description': description,
      });

      print("Added House");
    } catch (error) {
      print("Failed to add House: $error");
    }
  }

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
                          typeHouse = "شقه";
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
                          typeHouse = "استيديو";
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
                          genger = "شباب";
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
                          genger = "بنات";
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
                      setState(() {});
                  
                    },
                    title: "مكيفه",
                  ),
                  CustomCheckbox(
                    title: "Wi-Fi",
                    selectedTitle: (value) {
                      wifi = value;
                      setState(() {});
                     
                    },
                  ),
                  CustomCheckbox(
                      title: "غاز طبيعي",
                      selectedTitle: (value) {
                        naturalgas = value;
                        setState(() {});
                   
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
                      onPressed: pickImage,
                      icon: const Icon(FontAwesomeIcons.photoFilm)),
                  const SizeVertical(value: 2),
                  CustomGeneralButton(
                    text: "اضف الشقه",
                    onTap: () {
                      addHouse();
                    //  print(typeHouse);
                    //   print(genger);
                   
                    //   print(numpersOfRome);
                    //   print(numpersOfBad);
                    //   print(naturalgas);
                    //   print(description);
                      print(airConditioner);
                      print(wifi);
                      print(naturalgas);
                    //   print(prise);
                    // 
                    },
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
    await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {});
  }
}
