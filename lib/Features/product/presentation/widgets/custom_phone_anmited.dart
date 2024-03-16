import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/responsive.dart';
import '../../../home/data/cubit/coll/coll_cubit.dart';

class CustomPhoneAnmited extends StatelessWidget {
  const CustomPhoneAnmited({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CollCubit>(context).makePhoneCall(phoneNumber: '01021196367');
      },
      child: Container(
        height: SizeConfig.defaultSize! * 6.2,
        width: SizeConfig.defaultSize! * 6.2,
        decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Lottie.asset(
          AppAssets.phone,
        ),
      ),
    );
  }
}
