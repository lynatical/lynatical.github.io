import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/classes/customer_info.dart';
import 'package:rta_map_services/providers/customer_info_controller.dart';
import 'package:rta_map_services/providers/search_controller.dart';
import 'package:rta_map_services/providers/stepper_controller.dart';
import 'package:rta_map_services/ui/buttons/custom_filled_button.dart';
import 'package:rta_map_services/ui/inputs/custom_inputs.dart';
import 'package:rta_map_services/ui/views/widgets/custom_list_tile.dart';

class AddressFormView extends StatefulWidget {
  const AddressFormView({Key? key}) : super(key: key);

  @override
  State<AddressFormView> createState() => _AddressFormViewState();
}

class _AddressFormViewState extends State<AddressFormView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool mobile = size.width < 600 ? true : false;

    final stepper = Provider.of<StepperController>(context);
    final customerInfo = Provider.of<CustomerInfoProvider>(context);

    return Builder(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Consumer<SearchController>(
                        builder: (_, controller, __) {
                          final places = controller.places ?? [];
                          if (places.isNotEmpty) {
                            controller.hasSuggestions = true;
                          } else {
                            controller.hasSuggestions = false;
                          }
                          return Column(
                            children: [
                              //Street
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: TextFormField(
                                      key: const ObjectKey('street'),
                                      autofocus: true,
                                      controller: controller.streetController,
                                      onChanged: (value) {
                                        controller.street = value;
                                        controller.onAddressChanged(value);
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a number and street';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: Color(0xff324057)),
                                      decoration:
                                          CustomInputs().formInputDecoration(
                                        label: 'Number and street',
                                        icon: Icons.location_pin,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),

                                  //Zipcode
                                  Flexible(
                                    flex: 1,
                                    child: TextFormField(
                                      key: const ObjectKey('zipcode'),
                                      controller: controller.zipcodeController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a zipcode';
                                        }
                                        return null;
                                      },
                                      style: const TextStyle(
                                          color: Color(0xff324057)),
                                      decoration:
                                          CustomInputs().formInputDecoration(
                                        label: 'Zipcode',
                                        icon: Icons.house,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 20,
                              ),

                              Row(
                                children: [
                                  //City
                                  Flexible(
                                    child: TextFormField(
                                      key: const ObjectKey('city'),
                                      readOnly: true,
                                      enabled: false,
                                      controller: controller.cityController,
                                      style: const TextStyle(
                                          color: Color(0xff324057)),
                                      decoration:
                                          CustomInputs().formInputDecoration(
                                        label: 'City',
                                        icon: Icons.business,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),

                                  //State
                                  Flexible(
                                    child: TextFormField(
                                      key: const ObjectKey('state'),
                                      readOnly: true,
                                      enabled: false,
                                      controller: controller.stateController,
                                      style: const TextStyle(
                                          color: Color(0xff324057)),
                                      decoration:
                                          CustomInputs().formInputDecoration(
                                        label: 'State',
                                        icon: Icons.assistant_photo_outlined,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              mobile ? Container() : const SizedBox(height: 10),

                              // Se usa material para que se dibuje encima del
                              // contenedor padre (con BoxDecoration)
                              Material(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: places.length,
                                  itemBuilder: (_, index) {
                                    final place = places[index];
                                    return CustomListTile(
                                      place: place,
                                      controller: controller,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      mobile
                          ? const SizedBox(height: 15)
                          : const SizedBox(height: 20),

                      //Apply button
                      Builder(builder: (context) {
                        final controller = context.watch<SearchController>();
                        final location = controller.location;

                        return CustomFilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              controller.fillAddressFields();
                              controller.confirmLocation();
                              controller.clearPlaces();

                              if (location == null) {
                                //El usuario escribe algo en el input sin elegir un item de la lista
                                await controller.getLocation();
                              } else {
                                // ignore: avoid_print
                                print('Location is: ${location.address}');
                                // ignore: avoid_print
                                print(location.position);
                                controller
                                    .defineCurrentLocation(location.position);

                                //Se verifica el tipo de cobertura de la dirección actual
                                await controller.confirm();

                                //Aquí se guarda la cobertura actual
                                // ignore: avoid_print
                                print(controller.coverageType);

                                var leadInfo = CustomerInfo(
                                    street: controller.street,
                                    city: controller.city,
                                    state: controller.state,
                                    zipcode: controller.zipcode,
                                    coverageType: controller.coverageType,
                                    locationPosition: location.position);

                                customerInfo.setLeadInfo(leadInfo);

                                stepper.stepForward();
                              }
                            }
                            // ignore: use_build_context_synchronously
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          text: 'Continue',
                          bgColor: const Color(0xFFD20030),
                        );
                      }),

                      const SizedBox(height: 5)
                    ],
                  ),
                  Builder(builder: (context) {
                    final controller = context.watch<SearchController>();
                    return Visibility(
                      visible: controller.isVisibleWarning,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 600,
                              height: 200,
                              padding: const EdgeInsets.all(3),
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Center(
                                  child: Text(
                                'Address not found \n Please verify the input data',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: const Color(0xff001E4D),
                                    fontWeight: FontWeight.w200),
                              )),
                            ),
                            CustomFilledButton(
                              onPressed: () {
                                controller.clickOKWarning();
                              },
                              text: 'OK',
                              bgColor: const Color(0xFFD20030),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
