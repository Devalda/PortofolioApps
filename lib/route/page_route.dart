import 'package:devaldaporto/pages/home.dart';
import 'package:devaldaporto/pages/mymedia.dart';
import 'package:devaldaporto/pages/myproject.dart';
import 'package:devaldaporto/pages/profile.dart';
import 'package:devaldaporto/pages/quotegen.dart';
import 'package:devaldaporto/pages/welcome.dart';
import 'package:devaldaporto/route/name_route.dart';
import 'package:get/route_manager.dart';

class PGRT {
  static final pages = [
    GetPage(name: RouteName.welcome, page: () => WelcomePage()),
    GetPage(name: RouteName.myMedia, page: () => MyMedia()),
    GetPage(name: RouteName.profile, page: () => Profile()),
    GetPage(name: RouteName.home, page: () => Home()),
    GetPage(name: RouteName.quoteGen, page: () => QuoteGen()),
    GetPage(name: RouteName.myProject, page: () => MyProject())
  ];
}
