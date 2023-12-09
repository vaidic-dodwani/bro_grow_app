import 'package:bro_grow_app/utils/provider/app_providers.dart';
import 'package:bro_grow_app/utils/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch(
              // accentColor: AppColors.loginContainerColor,
              ),
        ),
        routerConfig: GoRouterConfig.router,
      ),
    );
  }
}
