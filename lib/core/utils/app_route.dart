import 'package:go_router/go_router.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/views/client_details_view.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/views/get_client_view.dart';
import 'package:house_app_one/Features/admin/add_client/presentation/views/srarch_client_view.dart';
import 'package:house_app_one/Features/communication/presentation/view/help_view.dart';
import 'package:house_app_one/Features/location/presentation/views/location_view.dart';
import 'package:house_app_one/Features/navbar/presentation/views/nave_home_bar.dart';
import '../../Features/Splach/view/splach_view.dart';
import '../../Features/admin/add-house_manger/presentation/views/add_house_manger_view.dart';
import '../../Features/admin/add-house_manger/presentation/views/get_house_mangers_view.dart';
import '../../Features/admin/add-house_manger/presentation/views/manger_details_view.dart';
import '../../Features/admin/add-house_manger/presentation/views/search_In_manger_view.dart';
import '../../Features/admin/add_Product/presentation/views/add_product.dart';
import '../../Features/admin/add_client/presentation/views/add_client_view.dart';
import '../../Features/admin/admin_home/presentation/views/admin_home.dart';
import '../../Features/admin/searsh_in_house/presentation/views/search_in_house.dart';
import '../../Features/notifacation/presentation/view/notifacation.dart';
import '../../Features/on_boarding/presentation/on_boardin_view.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/onboardingView';
  static const kHomeView = '/homeView';
  static const kHelpView = '/helpView';
  static const kNotifacationView = '/notifacationview';
  static const KProductView = '/productView';
  static const KLocationView = '/LocationView';
//admin
  static const KAdminHome = '/admininhome';
  static const KAddProductView = '/addproduct';
  static const KSearchInHouse = '/searchinhouse';
  static const KAddHouseMangerView = '/addhousemangerview';
  static const KMangerDeailsView = '/Mangerdetails';
  static const KSearchInMangerView = '/searchinmangerview';
  static const KHouseMangersViewe = '/housemangersview';
  static const KAddClientView = '/addclientview';
  static const KClinetDetailsView= '/clinetdetailsview';
  static const KGetClientView= '/getclientview';
  static const KSearchClientView= '/searchclientview';

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
      GoRoute(
        path: KSearchInHouse,
        builder: (context, state) => SearchInHouse(),
      ),
      GoRoute(
        path: KAddHouseMangerView,
        builder: (context, state) => AddHouseMangerView(),
      ),
      GoRoute(
        path: KMangerDeailsView,
        builder: (context, state) => MangerDetailsView(),
      ),
      GoRoute(
        path: KSearchInMangerView,
        builder: (context, state) => SearchInMangerView(),
      ),
      GoRoute(
        path: KHouseMangersViewe,
        builder: (context, state) => HouseMangersView(),
      ),
      GoRoute(
        path: KAddClientView,
        builder: (context, state) => AddClientView(),
      ),
      GoRoute(
        path: KClinetDetailsView,
        builder: (context, state) => ClinetDetailsView(),
      ),
      GoRoute(
        path: KGetClientView,
        builder: (context, state) => GetClientView(),
      ),
      GoRoute(
        path: KSearchClientView,
        builder: (context, state) => SearchClientView(),
      ),
    ],
  );
}
