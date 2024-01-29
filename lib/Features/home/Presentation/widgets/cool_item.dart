import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:house_app_one/Features/home/Presentation/widgets/custom_coll.dart';

import '../../../../core/utils/responsive.dart';
import '../../data/cubit/coll/coll_cubit.dart';
import '../../data/models/house_model.dart';

class CollItem extends StatelessWidget {
  const CollItem({super.key, required this.data});
  final HouseModel data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollCubit, CollState>(
      builder: (context, state) {
        return Row(
          children: [
            CustomColl(
              onTap: () {
                BlocProvider.of<CollCubit>(context).makePhoneCall();
              },
              color: Colors.blue,
              icon: Icons.phone,
            ),
            const SizeHorizontal(value: 1.5),
            CustomColl(
              onTap: () {
                BlocProvider.of<CollCubit>(context)
                    .launchWhatsApp(data.idHouse);
              },
              color: const Color(0xFF4EFF75),
              icon: FontAwesomeIcons.whatsapp,
            ),
          ],
        );
      },
    );
  }
}
