import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'package:house_app_one/core/shered_preferences/App_cach_data.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:house_app_one/core/widgets/custom_error_massege.dart';
import 'package:lottie/lottie.dart';

class LocationUniversitySearchBarView extends StatefulWidget {
  const LocationUniversitySearchBarView({super.key});

  @override
  State<LocationUniversitySearchBarView> createState() =>
      _LocationUniversitySearchBarViewState();
}

class _LocationUniversitySearchBarViewState
    extends State<LocationUniversitySearchBarView> {
  void initState() {
    super.initState();
  
    _fetchSuggestions('');
  }

  String searchValue = '';
  List<String> suggestions = [];
  Future<void> _fetchSuggestions(String value) async {
    await Future.delayed(const Duration(milliseconds: 750));
    setState(() {
      suggestions = _suggestions
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  String? getAbbreviation(String input) {
    RegExp regex = RegExp(r'\((.*?)\)');
    RegExpMatch? match = regex.firstMatch(input);
    return match != null ? match.group(1) : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        
        title: Text(
          'اختار الجامعه',
          style: GoogleFonts.cairo(),
        ),
        onSearch: (value) => _fetchSuggestions(value),
      ),
      body: suggestions.isNotEmpty
          ? ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestions[index]),
                  onTap: () async {
                    String? selectedAbbreviation =
                        getAbbreviation(suggestions[index]);
                    // print(
                    //     'Selected: ${suggestions[index]} - Abbreviation: $selectedAbbreviation');
                    if (selectedAbbreviation == "MTI") {
                      await CacheData.setData(
                          key: AppChachData.loocationUniversity,
                          value: selectedAbbreviation);
                      BlocProvider.of<GethouseCubit>(context).getData();
                      Navigator.pop(context);
                    } else {
                      CustomError.error(context,
                          dialogType: DialogType.info,
                          title: "لاسف",
                          desc: "لم يتم تفعيل الخدمه في هذا المكان الان");
                    }
                  },
                );
              },
            )
          : Center(child: Lottie.asset(AppAssets.Loding1)),
    );
  }

  final List<String> _suggestions = [
    "جامعة القاهرة (CU)",
    "جامعة عين شمس (ASU)",
    "جامعة الأزهر (AU)",
    "جامعة القناة (SCU)",
    "جامعة الإسكندرية (AU)",
    "جامعة حلوان (HU)",
    "جامعة المنصورة (MU)",
    "جامعة بنها (BU)",
    "جامعة المنوفية (MU)",
    "جامعة أسيوط (AU)",

    // جامعات خاصة
    "جامعه الحديثه للعلوم والتكنولوجيا (MTI)",
    "جامعة القاهرة للعلوم والتكنولوجيا (CUST)",
    "جامعة النيل (NU)",
    "جامعة مصر للعلوم والتكنولوجيا (MUST)",
    "جامعة الأهرام الكندية (CIC)",
    "جامعة 6 أكتوبر (O6U)",
    "جامعة مودرن ساينس وتكنولوجي (MSA)",
    "جامعة الفيوم (FU)",
    "جامعة دار العلوم (DUS)",
    "جامعة مصر الدولية (MIU)",
    "جامعة زويل (ZU)",

    // معاهد
    "معهد الدراسات الفندقية والسياحية (HTI)",
    "معهد التكنولوجيا العالي (HTI)",
    "معهد الإدارة العامة (IGA)",
    "معهد الهندسة العالي (HEI)",
    "معهد الفنون الجميلة (FAI)",
    "معهد الدراسات الإسلامية (IIIS)"
  ];
}
