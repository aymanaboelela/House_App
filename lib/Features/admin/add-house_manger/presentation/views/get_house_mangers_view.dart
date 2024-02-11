import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/get_house_manger/get_house_manger_cubit.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/models/get_house_mangers_model/get_house_mangers_model.dart';
import 'package:house_app_one/Features/admin/add-house_manger/presentation/views/widgets/custom_house_manger_Item.dart';
import 'package:house_app_one/core/utils/assets.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HouseMangersView extends StatefulWidget {
  HouseMangersView({Key? key});

  @override
  State<HouseMangersView> createState() => _HouseMangersViewState();
}

class _HouseMangersViewState extends State<HouseMangersView> {
  bool isLoding = false;
  @override
  void initState() {
    BlocProvider.of<GetHouseMangerCubit>(context).getData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetHouseMangerCubit, GetHouseMangerState>(
      listener: (context, state) {
        if (state is IsLodingGetHouseManger) {
          isLoding = true;
        } else if (state is IsSucssesGetHouseMager) {
          isLoding = false;
        } else if (state is IsFeilerGetHouseManger) {
          isLoding = false;
        }
      },
      builder: (context, state) {
        List<HouseMangerModel> data =
            BlocProvider.of<GetHouseMangerCubit>(context).data;
        return RefreshIndicator(
          onRefresh: () =>
              BlocProvider.of<GetHouseMangerCubit>(context).getData(),
          // displacement: 50,
          edgeOffset: 50,
          child: ModalProgressHUD(
            inAsyncCall: isLoding,
            progressIndicator: Lottie.asset(AppAssets.Loding1),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("اصحاب العقارات", style: GoogleFonts.cairo()),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CustomHouseMangerItem(
                      data: data[index],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
