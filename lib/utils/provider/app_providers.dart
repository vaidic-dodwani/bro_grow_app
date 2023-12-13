import 'package:bro_grow_app/view_model/homepage_view_model/homepage_provider.dart';
import 'package:bro_grow_app/view_model/login_view_model/login_view_model.dart';
import 'package:bro_grow_app/view_model/pincode_details_view_model/pincode_details_provider.dart';
import 'package:bro_grow_app/view_model/review_view_model/review_view_model.dart';
import 'package:bro_grow_app/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SplashScreenNotifier()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => PincodeProvider()),
    ChangeNotifierProvider(create: (_) => HomepageProvider()),
    ChangeNotifierProvider(create: (_) => ReviewProvider())
  ];
}
