import 'package:bro_grow_app/utils/routes/routes.dart';
import 'package:bro_grow_app/view_model/login_view_model/login_view_model.dart';
import 'package:bro_grow_app/view_model/pincode_details_view_model/pincode_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<LoginProvider>(context, listen: false).getUserState().then(
          (isLoggedIn) {
            if (isLoggedIn) {
              final pinProv =
                  Provider.of<PincodeProvider>(context, listen: false);
              pinProv.getDetails().whenComplete(
                () {
                  if (pinProv.city.isEmpty ||
                      pinProv.state.isEmpty ||
                      pinProv.pincode.isEmpty ||
                      pinProv.category.isEmpty) {
                    context.goNamed(AppRouteNames.pincodeRoute);
                  } else {
                    context.goNamed(AppRouteNames.homeScreenRoute);
                  }
                },
              );
            } else {
              context.goNamed(AppRouteNames.loginScreenRoute);
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("BroCode"),
      ),
    );
  }
}
