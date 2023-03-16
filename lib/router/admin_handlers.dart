// ignore_for_file: avoid_print

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rta_map_services/ui/layouts/auth/auth_layout.dart';

class AdminHandlers {
  static Handler homePage = Handler(handlerFunc: (context, params) {
    print('Entered homePage Handler');
    // The root route is always pushed at the start of the app (even if the route
    // is different). We have to avoid creating the same layout twice to preserve
    // the state
    if (Uri.base.toString().contains('/?')) {
      //has query parameters (will be rebuilt anyway)
      return Container();
    } else {
      //no query parameters
      return const AuthLayout();
    }
  });
}
