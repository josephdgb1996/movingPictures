import 'package:auto_route/auto_route_annotations.dart';
import 'package:movingPictures/presentation/main_layout_appbar_navbar/main_body_layout.dart';
import 'package:movingPictures/presentation/signin/sign_in_screen.dart';

import '../splash/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CupertinoRoute(page: SplashScreen, initial: true),
    CupertinoRoute(page: SignInScreen),
    CupertinoRoute(page: MainLayout),
  ],
  generateNavigationHelperExtension: true,
)
class $AppRouter {}
