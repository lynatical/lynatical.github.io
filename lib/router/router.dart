import 'package:fluro/fluro.dart';
import 'package:rta_map_services/router/admin_handlers.dart';
import 'package:rta_map_services/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String leadRoute = '/lead';
  static String winnerRoute = '/getWinner';
  static String giveawayRoute = '/giveaway';

  static void configureRoutes() {
    router.define(
      rootRoute,
      handler: AdminHandlers.leadPage,
      transitionType: TransitionType.none,
    );

    router.define(
      leadRoute,
      handler: AdminHandlers.leadPage,
      transitionType: TransitionType.none,
    );

    router.define(
      giveawayRoute,
      handler: AdminHandlers.giveawayPage,
      transitionType: TransitionType.none,
    );

    router.define(
      winnerRoute,
      handler: AdminHandlers.winnerPage,
      transitionType: TransitionType.none,
    );

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
