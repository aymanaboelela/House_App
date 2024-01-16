import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/favorites_cubit.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      // body: BlocBuilder<FavoritesCubit, List<bool>>(
      //   builder: (context, favorites) {
      //     List<int> favoriteIndices = [];
      //     for (int i = 0; i < favorites.length; i++) {
      //       if (favorites[i]) {
      //         favoriteIndices.add(i);
      //       }
      //     }

      //     return ListView.builder(
      //       itemCount: favoriteIndices.length,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           title: Text('Favorite Item ${favoriteIndices[index]}'),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
