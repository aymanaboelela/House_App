

import 'package:go_router/go_router.dart';

import '../../Features/Splach/view/splach_view.dart';
import '../../Features/home/Presentation/views/home_view.dart';
import '../../Features/on_boarding/on_boarding.dart';
import '../../Features/product/presentation/view/product_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const OnBordingView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const ProductView(),
      ),
    ],
  );
}