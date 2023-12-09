import 'package:bro_grow_app/utils/routes/app_route_names.dart';
import 'package:bro_grow_app/utils/routes/navigator_key.dart';
import 'package:go_router/go_router.dart';
import '../../view/screens/splash_screen/splash_screen.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: AppRouteNames.splashScreenRoute,
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
  );
}
