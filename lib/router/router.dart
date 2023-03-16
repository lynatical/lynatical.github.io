import 'package:fluro/fluro.dart';
import 'package:rta_map_services/router/admin_handlers.dart';
import 'package:rta_map_services/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  static void configureRoutes() {
    // Auth Routes
    router.define(
      rootRoute,
      handler: AdminHandlers.homePage,
      transitionType: TransitionType.none,
    );
    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
