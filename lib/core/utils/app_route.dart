import 'package:go_router/go_router.dart';
import '../../Features/Splach/view/splach_view.dart';
import '../../Features/home/Presentation/views/home_view.dart';

import '../../Features/on_boarding/presentation/on_boardin_view.dart';
import '../../Features/product/presentation/view/product_view.dart';

abstract class AppRouter {


  static const kOnBoardingView = '/onboardingView';
  static const kHomeView = '/homeView';
  static const KProductView = '/productView';

//nav Bat roure
  static const kChatView = '/chatView';
  static const kLikeProductView = '/likeproducyView';
  static const kCallPhone = '/callphone';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: KProductView,
        builder: (context, state) => const ProductView(),
      ),
      // GoRoute(
      //   path: kChatView,
      //   builder: (context, state) => const ProductView(),
      // ),
      // GoRoute(
      //   path: kLikeProductView,
      //   builder: (context, state) => const ProductView(),
      // ),
      // GoRoute(
      //   path: kCallPhone,
      //   builder: (context, state) => const ProductView(),
      // ),
    ],
  );
}
