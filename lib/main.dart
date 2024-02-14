import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_app_one/Features/Auth/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/add_house_manger/add_house_manger_cubit.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/cubit/get_house_manger/get_house_manger_cubit.dart';
import 'package:house_app_one/Features/admin/add_client/data/cubits/add_client/add_client_cubit.dart';
import 'package:house_app_one/Features/admin/add_client/data/cubits/get_client/get_client_cubit.dart';
import 'package:house_app_one/Features/admin/add_house/data/cubit/add_house_cubit.dart';
import 'package:house_app_one/Features/home/data/cubit/favorite/favorite_cubit.dart';
import 'package:house_app_one/core/shered_preferences/shared_preferences.dart';
import 'package:house_app_one/core/thems/them.dart';
import 'package:house_app_one/firebase_options.dart';
import 'Features/home/data/cubit/coll/coll_cubit.dart';
import 'Features/home/data/cubit/filters/filters_cubit.dart';
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
          create: (context) => AddHouseMangerCubit(),
        ),
        BlocProvider(
          create: (context) => GetHouseMangerCubit(),
        ),
        BlocProvider(
          create: (context) => AddClientCubit(),
        ),
        BlocProvider(
          create: (context) => GethouseCubit(),
        ),
        BlocProvider(
          create: (context) => GetClientCubit(),
        ),
        BlocProvider(
          create: (context) => CollCubit(),
        ),
        BlocProvider(
          create: (context) => FiltersCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
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
// & "C:\Program Files\Android\Android Studio\jre\bin\keytool" -genkeypair -v -keystore "C:\path\to\keystore.jks" -keyalg RSA -keysize 2048 -validity 10000 -storetype JKS
