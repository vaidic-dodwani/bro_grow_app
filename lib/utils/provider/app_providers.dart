import 'package:bro_grow_app/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => SplashScreenNotifier()),
  ];
}
