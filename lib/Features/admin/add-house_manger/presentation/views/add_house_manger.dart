import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/add_house_manger/add_house_manger_cubit.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/get_house_manger/get_house_manger_cubit.dart';

import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_buttons.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/widgets/custom_error_massege.dart';

class AddHouseMangerView extends StatelessWidget {
  const AddHouseMangerView({Key? key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? idHouse;
    String? name;
    String? phoneNumber;
    String? nameOfUniversity;
    String? ground;
    String? addrese;
    bool isLoging = false;

    return BlocConsumer<AddHouseMangerCubit, AddHouseMangerState>(
      listener: (context, state) {
        if (state is IsLodingAddHouseManger) {
          isLoging = true;
        }
        if (state is IsSucssesAddHousemanger) {
          isLoging = false;

          CustomError.error(context,
              dialogType: DialogType.success,
              title: "نجح",
              desc: "تم اضافه الشقه بنجاح");
          // BlocProvider.of<GethouseCubit>(context).getData();
        }
        if (state is IsFeilerAddHousemanger) {
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
          progressIndicator: Lottie.asset(AppAssets.Loding1),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "اضافه معلومات صاحب الشقه ",
                style: GoogleFonts.cairo(),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        title: "ID :",
                        onChanged: (value) {
                          idHouse = value;
                        },
                        icon: Icons.apartment_rounded,
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "الاسم :",
                        onChanged: (value) {
                          name = value;
                        },
                        icon: Icons.person,
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "رقم الهاتف :",
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        icon: Icons.phone_android_outlined,
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "اسم الجامعه :",
                        onChanged: (value) {
                          nameOfUniversity = value;
                        },
                        icon: Icons.business_outlined,
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "الطابق :",
                        onChanged: (value) {
                          ground = value;
                        },
                        icon: Icons.tire_repair_sharp,
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "العنوان بتفصيل :",
                        onChanged: (value) {
                          addrese = value;
                        },
                        icon: Icons.edit_location_alt_sharp,
                      ),
                      SizeVertical(value: 1),
                      IconButton(
                        onPressed: BlocProvider.of<AddHouseMangerCubit>(context)
                            .pickImages,
                        icon: Icon(
                          Icons.add_photo_alternate_rounded,
                          size: 50,
                        ),
                      ),
                      SizeVertical(value: 1),
                      CustomGeneralButton(
                        text: "اضف صاحب شقه",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AddHouseMangerCubit>(context)
                                .AddHouseManger(
                              idHouse: idHouse!,
                              name: name!,
                              phoneNumber: phoneNumber!,
                              nameOfUniversity: nameOfUniversity!,
                              ground: ground!,
                              addrese: addrese!,
                            );
                          }
                          BlocProvider.of<GetHouseMangerCubit>(context)
                              .getData();
                        },
                      ),
                      SizeVertical(value: 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
