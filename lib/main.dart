import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/providers/customer_info_controller.dart';
import 'package:rta_map_services/router/router.dart';
import 'package:rta_map_services/services/navigation_service.dart';

import 'providers/stepper_controller.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<StepperController>(
          create: (_) => StepperController()),
      ChangeNotifierProvider<CustomerInfoProvider>(
          create: (_) => CustomerInfoProvider()),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giveaway',
      debugShowCheckedModeBanner: false,
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(const Color(0xff2e5899)),
        ),
      ),
    );
  }
}
