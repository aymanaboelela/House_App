import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/Auth/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:house_app_one/core/utils/app_route.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/utils/responsive.dart';
import 'package:house_app_one/core/widgets/custom_buttons.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:house_app_one/core/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool isLoding = false;
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('*************User is currently signed out!');
      } else {
        print('***********User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        setState(() {
          isLoding = state is AuthLoding;
        });

        if (state is AuthSucceed) {
          GoRouter.of(context).pushReplacement(AppRouter.KAdminHome);
        } else if (state is AuthUserFound) {
          CustomError.error(context,
              dialogType: DialogType.error, title: "خطاء", desc: state.error);
        } else if (state is AuthWrongPassword) {
          CustomError.error(context,
              dialogType: DialogType.error, title: "خطاء", desc: state.error);
        } else if (state is AuthFlid) {
          CustomError.error(context,
              dialogType: DialogType.error,
              title: "خطاء",
              desc: "لايسمح بدخول غير الادمن");
        }
        ;
      },
      builder: (context, state) {
        String? email;
        String? password;
        return ModalProgressHUD(
          inAsyncCall: isLoding,
          progressIndicator: LottieBuilder.asset(AppAssets.Loding1),
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "تسجيل الدخول",
                  style: GoogleFonts.cairo(),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset(AppAssets.login,
                            height: SizeConfig.defaultSize! * 20),
                      ),
                      CustomTextFormField(
                        hintText: "ادخل البريد الإلكتروني ",
                        title: "البريد الإلكتروني :",
                        icon: Icons.email,
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizeVertical(value: 1),
                      CustomTextFormField(
                        hintText: "ادخل كلمة السر ",
                        isVisible: true,
                        title: "كلمة السر :",
                        icon: Icons.lock_open,
                        onChanged: (value) {
                          password = value;
                        },
                        onFieldSubmitted: (value) {
                          password = value;
                        },
                      ),
                      SizeVertical(value: 2.9),
                      CustomGeneralButton(
                        text: "تسجيل دخول للإدمن",
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            BlocProvider.of<AuthCubit>(context)
                                .LogeIn(email: email!, password: password!);
                          }
                        },
                      ),
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
