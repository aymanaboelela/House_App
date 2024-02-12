import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_client/data/cubits/add_client/add_client_cubit.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_buttons.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddClientView extends StatelessWidget {
  AddClientView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  String? name;
  String? idHouse;
  String? phoneNumber;
  String? nameOfUniversity;
  String? price;
  bool isLoding = false;
  Widget build(BuildContext context) {
    return BlocConsumer<AddClientCubit, AddClientState>(
      listener: (context, state) {
        if (state is IsLodingAddClient) {
          isLoding = true;
        } else if (state is IsSucssesAddClient) {
          isLoding = false;
          CustomError.error(context,
              dialogType: DialogType.success,
              title: "نجح",
              desc: "تم اضافه المستاجر بنجاح");
        } else if (state is IsFeilerAddClient) {
          isLoding = false;
        } else if (state is IamgeFeiler) {
          isLoding = false;
          CustomError.error(context,
              dialogType: DialogType.error,
              title: "فشل",
              desc: "فشلت اضافه المستاجر ");
          CustomError.error(context,
              dialogType: DialogType.error, title: "فشل", desc: "اضف صوره ");
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoding,
          progressIndicator: Lottie.asset(AppAssets.Loding1),
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "اضف مستاجر",
                  style: GoogleFonts.cairo(),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        title: "الاسم :",
                        icon: Icons.person,
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "id الشقه :",
                        icon: Icons.insert_drive_file_rounded,
                        onChanged: (value) {
                          idHouse = value;
                        },
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "رقم الهاتف :",
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: " اسم الحامعه :",
                        icon: Icons.phone,
                        onChanged: (value) {
                          nameOfUniversity = value;
                        },
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        title: "رقم العموله :",
                        icon: Icons.attach_money_rounded,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          price = value;
                        },
                      ),
                      SizeVertical(value: 2),
                      Text(
                        " اضف صوه  العقد :",
                        style: GoogleFonts.cairo(fontSize: 20),
                      ),
                      SizeVertical(value: 1),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AddClientCubit>(context)
                              .pickImageFromCamera();
                        },
                        icon: Icon(
                          Icons.photo_rounded,
                          size: 45,
                        ),
                      ),
                      SizeVertical(value: 2),
                      CustomGeneralButton(
                        text: "اضف مستاجر",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, submit data
                            BlocProvider.of<AddClientCubit>(context).addClient(
                                idHouse: idHouse!,
                                name: name!,
                                nameOfUniversity: nameOfUniversity!,
                                phoneNumber: phoneNumber!,
                                price: price!);
                          }
                        },
                      )
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