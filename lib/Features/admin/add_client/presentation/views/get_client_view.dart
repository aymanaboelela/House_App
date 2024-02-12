import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/admin/add_client/data/cubits/get_client/get_client_cubit.dart';
import 'package:house_app_one/Features/admin/add_client/data/models/client_model.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/widgets/custom_client_item.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/assets.dart';
import '../../../add-house_manger/data/cubit/get_house_manger/get_house_manger_cubit.dart';

class GetClientView extends StatefulWidget {
  GetClientView({Key? key});

  @override
  State<GetClientView> createState() => _ClientViewState();
}

class _ClientViewState extends State<GetClientView> {
  bool isLoding = false;
  @override
  void initState() {
    BlocProvider.of<GetClientCubit>(context).getData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetClientCubit, GetClientState>(
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
        List<clientModel> data = BlocProvider.of<GetClientCubit>(context).data;
        return RefreshIndicator(
          onRefresh: () => BlocProvider.of<GetClientCubit>(context).getData(),
          // displacement: 50,
          edgeOffset: 50,
          child: ModalProgressHUD(
            inAsyncCall: isLoding,
            progressIndicator: Lottie.asset(AppAssets.Loding1),
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                    "العدد : ${BlocProvider.of<GetClientCubit>(context).data.length}",
                    style: GoogleFonts.cairo()),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CustomClientItem(data: data[index]);
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
