import 'package:bro_grow_app/firebase_options.dart';
import 'package:bro_grow_app/utils/provider/app_providers.dart';
import 'package:bro_grow_app/utils/routes/app_route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
