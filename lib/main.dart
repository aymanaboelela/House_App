import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/add_Product/data/cubit/add_house_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/favorite/favorite_cubit.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/thems/them.dart';
import 'package:house_app_one/firebase_options.dart';
import 'Features/home/data/cubit/coll/coll_cubit.dart';
import 'Features/home/data/cubit/gethouse/gethouse_cubit.dart';
import 'core/utils/app_route.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheDataInit();
  await GoogleFonts();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => AddHouseCubit(),
        ),
        BlocProvider(
          create: (context) => GethouseCubit(),
        ),
        BlocProvider(
          create: (context) => CollCubit(),
        ),
      ],
      child: MaterialApp.router(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: darkMode,
        // darkTheme: darkMode,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
