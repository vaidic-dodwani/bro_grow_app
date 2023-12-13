import 'package:bro_grow_app/utils/routes/app_route_names.dart';
import 'package:bro_grow_app/utils/routes/navigator_key.dart';
import 'package:bro_grow_app/view/screens/homescreen/homescreen.dart';
import 'package:bro_grow_app/view/screens/login_screen/login_screen.dart';
import 'package:bro_grow_app/view/screens/otp_screen/otp_screen.dart';
import 'package:bro_grow_app/view/screens/pincode_detail/pincode_detail_screen.dart';
import 'package:go_router/go_router.dart';
import '../../view/screens/splash_screen/splash_screen.dart';

class GoRouterConfig {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: AppRouteNames.splashScreenRoute,
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: AppRouteNames.loginScreenRoute,
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
        routes: [
          GoRoute(
            name: AppRouteNames.otpScreenRoute,
            path: 'otp',
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>;
              return OtpScreen(
                verificationId: extra['verificationId'],
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: AppRouteNames.pincodeRoute,
        path: '/pincode',
        builder: (context, state) {
          final extra = (state.extra ?? {}) as Map<dynamic, dynamic>;
          return PincodeDetailScreen(
            ifPop: extra['ifPop'] ?? false,
          );
        },
      ),
      GoRoute(
        name: AppRouteNames.homeScreenRoute,
        path: '/home',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
