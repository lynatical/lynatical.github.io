import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/data/repositories_impl/geocode_repository_impl.dart';
import 'package:rta_map_services/data/repositories_impl/suggestions_repository_impl.dart';
import 'package:rta_map_services/providers/remote/geocode_api.dart';
import 'package:rta_map_services/providers/remote/suggestions_api.dart';
import 'package:rta_map_services/providers/search_controller.dart';

import 'package:rta_map_services/ui/views/stepper_widget.dart';
import 'package:rta_map_services/ui/views/submitted_view.dart';

import '../../../providers/customer_info_controller.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({Key? key}) : super(key: key);

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  SearchController controller = SearchController(
    SuggestionsRepositoryImpl(
      SuggestionsAPI(Dio()),
    ),
    GeocodeRepositoryImpl(
      GeocodeAPI(Dio()),
    ),
    UniqueKey(),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<SearchController>.value(
      value: controller,
      // key: ,
      child: Scaffold(body: body(size)),
    );
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print('Entered AuthLayout dispose() - key: ${widget.key}');
    controller.dispose();
    super.dispose();
  }

  Widget body(size) {
    return const _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = Provider.of<SearchController>(context);
    final customerInfo = Provider.of<CustomerInfoProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        searchController.clearPlaces();
      },
      child: Container(
        height: double.infinity,
        decoration: buildBoxDecoration('assets/images/bg_image.png'),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: customerInfo.orderSent
                          ? const SubmittedView()
                          : const StepperWidget()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration buildBoxDecoration(String image) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(image),
      fit: BoxFit.cover,
    ),
  );
}
