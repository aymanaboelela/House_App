import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/communication/presentation/view/help_view.dart';
import 'package:house_app_one/Features/location/presentation/views/location_view.dart';
import 'package:house_app_one/Features/navbar/presentation/views/nave_home_bar.dart';
import '../../Features/Splach/view/splach_view.dart';
import '../../Features/admin/add_Product/presentation/views/add_product.dart';
import '../../Features/admin/admin_home/presentation/views/admin_home.dart';
import '../../Features/notifacation/presentation/view/notifacation.dart';
import '../../Features/on_boarding/presentation/on_boardin_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onboardingView';
  static const kHomeView = '/homeView';
  static const kHelpView = '/helpView';
  static const kNotifacationView = '/notifacationview';
  static const KProductView = '/productView';
  static const KLocationView = '/KLocationView';
//admin
  static const KAdminHome = '/productView';
  static const KAddProductView = '/KAddProduct';

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
        builder: (context, state) => const NavBarHome(),
      ),
      GoRoute(
        path: kHelpView,
        builder: (context, state) => HelpView(),
      ),
      // GoRoute(
      //   path: KProductView,
      //   builder: (context, state) => ProductView(data:state.extra),
      // ),
      GoRoute(
        path: kNotifacationView,
        builder: (context, state) => const NotifacationView(),
      ),

      GoRoute(
        path: KLocationView,
        builder: (context, state) => LocationView(),
      ),
      // admin
      GoRoute(
        path: KAdminHome,
        builder: (context, state) => AdminHome(),
      ),
      GoRoute(
        path: KAddProductView,
        builder: (context, state) => AddProduct(),
      ),
    ],
  );
}
