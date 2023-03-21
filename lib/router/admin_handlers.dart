// ignore_for_file: avoid_print

import 'package:fluro/fluro.dart';
import 'package:rta_map_services/ui/layouts/auth/main_layout.dart';
import 'package:rta_map_services/ui/views/forms/giveaway_form_view.dart';
import 'package:rta_map_services/ui/views/widgets/stepper_widget.dart';

import '../ui/layouts/auth/get_winner_layout.dart';

class AdminHandlers {
  static Handler leadPage = Handler(handlerFunc: (context, params) {
    return const MainLayout(form: StepperWidget());
  });

  static Handler giveawayPage = Handler(handlerFunc: (context, params) {
    return const MainLayout(form: GiveawayFormView());
  });

  static Handler winnerPage = Handler(handlerFunc: (context, params) {
    return const WinnerLayout();
  });
}
