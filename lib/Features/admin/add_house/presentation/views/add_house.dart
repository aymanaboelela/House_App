import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../core/widgets/custom_toggle_button.dart';
import '../../data/cubit/add_house/add_house_cubit.dart';
import '../widgets/custom_check_bok.dart';
import '../widgets/custom_select_numper_of_bad.dart';
// ignore: must_be_immutable
class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text = nameOfUniversity ?? ""; // Set initial value
  }

  String? idHouse;
  String typeHouse = "شقه";
  String? genger = "شباب";
  String? price;
  String? nameOfUniversity = "MTI";
  String numpersOfRome = "3";
  String numpersOfBad = "6";
  String? description;
  bool? airConditioner = false;
  bool? wifi = false;
  bool? naturalgas = false;
  bool isLoging = false;
  bool? singelRome = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddHouseCubit(),
      child: BlocConsumer<AddHouseCubit, AddHouseState>(
        listener: (context, state) {
          if (state is IsLodingAddHouse) {
            isLoging = true;
          }
          if (state is IsSucssesAddHouse) {
            isLoging = false;

            CustomError.error(context,
                dialogType: DialogType.success,
                title: "نجح",
                desc: "تم اضافه الشقه بنجاح");
            BlocProvider.of<GethouseCubit>(context).getData();
          }
          if (state is IsFeilerAddHouse) {
            isLoging = false;
            CustomError.error(context,
                dialogType: DialogType.error,
                title: "فشل",
                desc: "فشلت اضافه الشقه ");
          }
          if (state is IamgeFeiler) {
            isLoging = false;
            CustomError.error(context,
                dialogType: DialogType.error, title: "فشل", desc: "اضف صوره ");
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoging,
            progressIndicator: Lottie.asset(AppAssets.Loding1,
                height: SizeConfig.defaultSize! * 11),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "إضافة شقة",
                  style: GoogleFonts.cairo(),
                ),
              ),
              body: Form(
                key: _formKey,
                child: CustomScrollView(
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
                                          .isApartmentSelected, //
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
                                          .isStudioSelected, //
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
                                        .chingeGenderBoyes();
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
                                        .chingeGenderGirls();
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
                            CustomCheckbox(
                                title: "غرفه سنجل",
                                selectedTitle: (value) {
                                  singelRome = value;
                                }),
                            const SizeVertical(value: 2),
                            CustomTextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              title: "سعر السرير:",
                              hintText: "سعر السرير",
                              icon: FontAwesomeIcons.moneyBill,
                              onChanged: (value) {
                                price = value;
                              },
                            ),
                            const SizeVertical(value: 2),
                            CustomTextFormField(
                              title: " ID : ",
                              hintText: "id",
                              icon: FontAwesomeIcons.idBadge,
                              onChanged: (value) {
                                idHouse = value;
                              },
                            ),
                            const SizeVertical(value: 2),
                            CustomTextFormField(
                              title: " اسم الجامعه : ",
                              hintText: "اسم الجامعه",
                              controller: _controller,
                              icon: FontAwesomeIcons.idBadge,
                              onChanged: (value) {
                                nameOfUniversity = value;
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
                                onPressed:
                                    BlocProvider.of<AddHouseCubit>(context)
                                        .pickImages,
                                icon: const Icon(FontAwesomeIcons.photoFilm)),
                            const SizeVertical(value: 2),
                            CustomGeneralButton(
                              text: "اضف الشقه",
                              onTap: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  BlocProvider.of<AddHouseCubit>(context)
                                      .addHouse(
                                    idHouse: idHouse!,
                                    typeHouse: typeHouse,
                                    gender: genger!,
                                    nameOfUniversity: nameOfUniversity!,
                                    numberOfRooms: numpersOfRome,
                                    numberOfBeds: numpersOfBad,
                                    airConditioner: airConditioner!,
                                    wifi: wifi!,
                                    naturalGas: naturalgas!,
                                    singelRome: singelRome!,
                                    price: price!,
                                    description: description!,
                                  );
                                }
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
            ),
          );
        },
      ),
    );
  }
}
