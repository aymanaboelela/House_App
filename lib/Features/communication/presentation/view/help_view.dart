import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_divider.dart';
import 'package:house_app_one/Features/home/data/models/house_model.dart';
import 'package:house_app_one/Features/product/presentation/widgets/custom_phone_anmited.dart';
import 'package:house_app_one/core/utils/assets.dart';

import 'package:house_app_one/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class HelpView extends StatelessWidget {
  HelpView({super.key});
  late HouseModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "مساعدة",
          style: GoogleFonts.cairo(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AppAssets.help),
            Text(
              "مرحبًا بك في تطبييق اكادو الذي يساعد الطلاب الغير محليين في العثور على سكن مناسب !",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(fontSize: 20),
            ),
            SizeVertical(value: 2),
            Text(
              "تم تصميم التطبيق ليوفر للطلاب الغير محليين فرصة الوصول إلى سكن بأسعار معقولة وبأقل عمولة .",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(fontSize: 20),
            ),
            SizeVertical(value: 2),
            Text(
              "سواء كنت تبحث عن سكن لواحدك أو مع زملاء دراستك، يقدم التطبيق خيارات متعددة تناسب احتياجات الجميع .",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(fontSize: 20),
            ),
            SizeVertical(value: 2),
            Text(
              "يتميز التطبيق بوجود جميع المواصفات التي قد يحتاجها الطالب الغير محلي في البحث عن سكن، مثل الموقع والأمان والتجهيزات .",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(fontSize: 20),
            ),
            SizeVertical(value: 2),
            Text(
              "نحن هنا لجعل رحلتك في العثور على سكن مريحة وسهلة. لا تتردد في التواصل معنا إذا كنت بحاجة إلى أي مساعدة !",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(fontSize: 20),
            ),
            SizeVertical(value: 2),
            Text(
              "اختار الشقه المناسبه \n اضغط علي رمز الاتصال او الواتساب\n للتواصل .",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 21,
              ),
            ),
            SizeVertical(value: 2),
            CustomDivider(),
            SizeVertical(value: 2),
            Text(
              "للدعم الفني اضغط علي علامه الاتصال ",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 21,
              ),
            ),
            SizeVertical(value: 2),
            CustomPhoneAnmited(),
          ],
        ),
      ),
    );
  }
}
