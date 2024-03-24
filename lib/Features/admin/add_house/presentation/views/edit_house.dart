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

class EditHouseView extends StatefulWidget {
  EditHouseView({Key? key, required this.index}) : super(key: key);
  
  final int index;
  State<EditHouseView> createState() => _EditProductState();
}

class _EditProductState extends State<EditHouseView> {
  TextEditingController _controllerPrise = TextEditingController();
  TextEditingController _controllerIdhouse = TextEditingController();
  TextEditingController _controllerNameOfUniversity = TextEditingController();
  TextEditingController _controllerdescription = TextEditingController();
  @override
  void initState() {
    super.initState();
    price = BlocProvider.of<GethouseCubit>(context).data[widget.index].price;
    idHouse =
        BlocProvider.of<GethouseCubit>(context).data[widget.index].idHouse;
    nameOfUniversity = BlocProvider.of<GethouseCubit>(context)
        .data[widget.index]
        .nameOfUniversity;
    description =
        BlocProvider.of<GethouseCubit>(context).data[widget.index].description;
    genger = BlocProvider.of<GethouseCubit>(context).data[widget.index].gender;
    typeHouse =
        BlocProvider.of<GethouseCubit>(context).data[widget.index].typeHouse;
    airConditioner = BlocProvider.of<GethouseCubit>(context)
        .data[widget.index]
        .airConditioner;
    wifi = BlocProvider.of<GethouseCubit>(context).data[widget.index].wifi;
    naturalgas =
        BlocProvider.of<GethouseCubit>(context).data[widget.index].naturalgas;
    singelRome =
        BlocProvider.of<GethouseCubit>(context).data[widget.index].singelRome;

    numpersOfRome = BlocProvider.of<GethouseCubit>(context)
        .data[widget.index]
        .numpersOfRoms;
    numpersOfBad =
        BlocProvider.of<GethouseCubit>(context).data[widget.index].numpersOfBad;
    setState(() {});
    _controllerNameOfUniversity.text = nameOfUniversity ?? "";
    _controllerIdhouse.text = idHouse ?? "";
    _controllerPrise.text = price ?? "";
    _controllerdescription.text = description ?? "";
  }

  @override
  void dispose() {
    _controllerNameOfUniversity.text;
    _controllerIdhouse.text;
    _controllerPrise.text;
    _controllerdescription.text;
    super.dispose();
  }

  String? idHouse;
  String? typeHouse;
  String? genger;
  String? price;
  String? nameOfUniversity;
  String? numpersOfRome;
  String? numpersOfBad;
  String? description;
  bool? airConditioner;
  bool? wifi;
  bool? naturalgas;
  bool? singelRome;

  bool isLoging = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddHouseCubit(),
      child: BlocConsumer<GethouseCubit, GethouseState>(
        listener: (context, state) {
          if (state is IsLodingEditHouse) {
            isLoging = true;
          }
          if (state is IsSucssesEditHouse) {
            isLoging = false;

            CustomError.error(context,
                dialogType: DialogType.success,
                title: "نجح",
                desc: "تم تعديل الشقه بنجاح");
            BlocProvider.of<GethouseCubit>(context).getData();
          }
          if (state is IsFeilerEditHouse) {
            isLoging = false;
            CustomError.error(context,
                dialogType: DialogType.error,
                title: "فشل",
                desc: "فشلت تعديل الشقه ");
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
                  "تعديل الشقة",
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
                                  label: "شقه ",
                                  isSelected: typeHouse == "شقه"
                                      ? BlocProvider.of<AddHouseCubit>(context)
                                          .isApartmentSelected = true
                                      : BlocProvider.of<AddHouseCubit>(context)
                                          .isApartmentSelected = false,
                                  onToggle: () {
                                    BlocProvider.of<AddHouseCubit>(context)
                                        .houseSelected();
                                    typeHouse = "شقه";
                                    setState(() {});
                                  },
                                ),
                                const SizeHorizontal(value: 1),
                                CustomToggleButton(
                                  label: "استيديو",
                                  isSelected: typeHouse == "استيديو"
                                      ? BlocProvider.of<AddHouseCubit>(context)
                                          .isStudioSelected = true
                                      : BlocProvider.of<AddHouseCubit>(context)
                                          .isStudioSelected = false,
                                  onToggle: () {
                                    typeHouse = "استيديو";
                                    BlocProvider.of<AddHouseCubit>(context)
                                        .houseSelected2();
                                    setState(() {});
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
                                  label: "شباب",
                                  isSelected: genger == "شباب"
                                      ? BlocProvider.of<AddHouseCubit>(context)
                                          .isMaleSelected = true
                                      : BlocProvider.of<AddHouseCubit>(context)
                                          .isMaleSelected = false,
                                  onToggle: () {
                                    genger = "شباب";
                                    BlocProvider.of<AddHouseCubit>(context)
                                        .chingeGenderBoyes();
                                    setState(() {});
                                  },
                                ),
                                const SizeHorizontal(value: 1),
                                CustomToggleButton(
                                  label: "بنات",
                                  isSelected: genger == "بنات"
                                      ? BlocProvider.of<AddHouseCubit>(context)
                                          .isFemaleSelected = true
                                      : BlocProvider.of<AddHouseCubit>(context)
                                          .isFemaleSelected = false,
                                  onToggle: () {
                                    genger = "بنات";
                                    BlocProvider.of<AddHouseCubit>(context)
                                        .chingeGenderGirls();
                                    setState(() {});
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
                              selectedNumber: numpersOfRome,
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
                              selectedNumber: numpersOfBad,
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
                              title: "مكيفه",
                              selectedTitle: (value) {
                                airConditioner = value;
                              },
                              isChecked: airConditioner,
                            ),
                            CustomCheckbox(
                              title: "Wi-Fi",
                              selectedTitle: (value) {
                                wifi = value;
                              },
                              isChecked: wifi,
                            ),
                            CustomCheckbox(
                              title: "غاز طبيعي",
                              selectedTitle: (value) {
                                naturalgas = value;
                              },
                              isChecked: naturalgas,
                            ),
                            CustomCheckbox(
                              title: "غرفه سنجل",
                              selectedTitle: (value) {
                                singelRome = value;
                              },
                              isChecked: singelRome,
                            ),
                            const SizeVertical(value: 2),
                            CustomTextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(),
                              controller: _controllerPrise,
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
                              controller: _controllerIdhouse,
                              onChanged: (value) {
                                idHouse = value;
                              },
                            ),
                            const SizeVertical(value: 2),
                            CustomTextFormField(
                              title: " اسم الجامعه : ",
                              hintText: "اسم الجامعه",
                              controller: _controllerNameOfUniversity,
                              icon: FontAwesomeIcons.idBadge,
                              onChanged: (value) {
                                nameOfUniversity = value;
                              },
                            ),
                            const SizeVertical(value: 2),
                            CustomTextFormField(
                              title: "وصف الشقة:",
                              hintText: "وصف الشقة",
                              controller: _controllerdescription,
                              icon: FontAwesomeIcons.houseChimney,
                              onChanged: (value) {
                                description = value;
                              },
                            ),
                            const SizeVertical(value: 2),
                            const SizeVertical(value: 2),
                            const SizeVertical(value: 2),
                            CustomGeneralButton(
                              text: "اضف الشقه",
                              onTap: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  BlocProvider.of<GethouseCubit>(context)
                                      .updateHouse(widget.index, {
                                    "Air Conditioner": airConditioner,
                                    "Description": description,
                                    "Gender": genger,
                                    "Name Of University": nameOfUniversity,
                                    "Natural Gas": naturalgas,
                                    "Number Of Beds": numpersOfBad,
                                    "Number Of Rooms": numpersOfRome,
                                    "Price": price,
                                    "Rome Singel": singelRome,
                                    "Type House": typeHouse,
                                    "Wi-Fi": wifi,
                                    "id House": idHouse,
                                  });
                                  BlocProvider.of<GethouseCubit>(context)
                                      .getData();
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
