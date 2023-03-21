
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/data/repositories_impl/geocode_repository_impl.dart';
import 'package:rta_map_services/data/repositories_impl/suggestions_repository_impl.dart';
import 'package:rta_map_services/providers/remote/geocode_api.dart';
import 'package:rta_map_services/providers/remote/suggestions_api.dart';
import 'package:rta_map_services/providers/search_controller.dart';
import 'package:rta_map_services/ui/views/submitted_view.dart';

import '../../../providers/customer_info_controller.dart';

class MainLayout extends StatefulWidget {
  final Widget form;

  const MainLayout({Key? key, required this.form}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  SearchController searchController = SearchController(
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
    final customerInfo = Provider.of<CustomerInfoProvider>(context);

    return ChangeNotifierProvider<SearchController>.value(
      value: searchController,
      // key: ,
      child: Scaffold(
          body: GestureDetector(
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
                            : widget.form),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print('Entered AuthLayout dispose() - key: ${widget.key}');
    searchController.dispose();
    super.dispose();
  }

  BoxDecoration buildBoxDecoration(String image) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
