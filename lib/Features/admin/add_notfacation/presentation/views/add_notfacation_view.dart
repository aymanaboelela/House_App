import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_notfacation/data/add_not_facation_cubit.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_buttons.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNotFacation extends StatefulWidget {
  const AddNotFacation({super.key});

  @override
  State<AddNotFacation> createState() => _AddNotFacationState();
}

String? title;
String? description;
bool isLoding = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _AddNotFacationState extends State<AddNotFacation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotFacationCubit(),
      child: BlocConsumer<AddNotFacationCubit, AddNotFacationState>(
        listener: (context, state) {
          if (state is IsLodingAddAddNotFacation) {
            isLoding = true;
          } else if (state is IsSucssesAddNotFacation) {
            isLoding = false;
            CustomError.error(context,
                dialogType: DialogType.success,
                title: "نجح",
                desc: "تم اضافه الاشعار بنجاح ");
          } else if (state is IsFeilerAddNotFacation) {
            isLoding = false;
            CustomError.error(context,
                dialogType: DialogType.info,
                title: "مشكله",
                desc: "لم يتم اضافه الاشعار ");
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ModalProgressHUD(
              inAsyncCall: isLoding,
              progressIndicator: Lottie.asset(AppAssets.Loding1),
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    "اضافه اشعار ",
                    style: GoogleFonts.cairo(),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        icon: Icons.title,
                        title: "العنون",
                        hintText: "اضف عنوان الرساله",
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                      SizeVertical(value: 2),
                      CustomTextFormField(
                        icon: Icons.description_rounded,
                        title: "اضف وصف الرساله",
                        onChanged: (value) {
                          description = value;
                        },
                      ),
                      SizeVertical(value: 3),
                      CustomGeneralButton(
                        text: "اضف اشعار",
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<AddNotFacationCubit>(context)
                                .sendNotification(title!, description!);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
