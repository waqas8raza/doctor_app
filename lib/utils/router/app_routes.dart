import 'package:doctor_app/controllers/auth/auth_check_page.dart';
import 'package:doctor_app/pages/auth_pages/login_page.dart';
import 'package:doctor_app/pages/bottom_navigation_bar_pages/bottom_navigation_bar_page.dart';
import 'package:doctor_app/pages/splash_page.dart';
import 'package:doctor_app/utils/router/route_names.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.authCheckPage,
          page: () => const AuthenticationCheckerPage(),
        ),
        GetPage(
          name: RouteName.splashPage,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: RouteName.loginPage,
          page: () => LoginPAge(),
        ),
        GetPage(
          name: RouteName.bottomNavBarPage,
          page: () => BottomNavBarPage(),
        ),
      ];
}
