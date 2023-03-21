import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/providers/search_controller.dart';
import 'package:rta_map_services/providers/stepper_controller.dart';
import 'package:rta_map_services/ui/views/widgets/lead_inputs.dart';
import '../../../providers/customer_info_controller.dart';
import '../../buttons/custom_filled_button.dart';
import '../../buttons/custom_outlined_button.dart';
import '../../inputs/custom_checkbox.dart';

class LeadFormView extends StatefulWidget {
  const LeadFormView({Key? key}) : super(key: key);

  @override
  State<LeadFormView> createState() => _LeadFormViewState();
}

class _LeadFormViewState extends State<LeadFormView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Controllers
    final stepper = Provider.of<StepperController>(context);
    final customerInfo = Provider.of<CustomerInfoProvider>(context);
    final searchController = Provider.of<SearchController>(context);

    const Color labelColor = Color.fromARGB(255, 105, 137, 185);
    const Color secondaryColor = Color(0xFFd20030);

    TextStyle textLabel = GoogleFonts.plusJakartaSans(color: labelColor);

    final List<Widget> serviceCheckboxes = [
      CustomCheckbox(
        value: customerInfo.internetCheckbox,
        onChanged: customerInfo.setInternetCheckbox,
        text: 'Internet',
      ),
      const SizedBox(width: 10),
      CustomCheckbox(
        value: customerInfo.tvCheckbox,
        onChanged: customerInfo.setTvCheckbox,
        text: 'TV',
      ),
      const SizedBox(width: 10),
      CustomCheckbox(
        value: customerInfo.voiceCheckbox,
        onChanged: customerInfo.setVoiceCheckbox,
        text: 'Voice',
      ),
    ];

    return Builder(
      builder: (context) {
        return Center(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Your service coverage type is: ",
                          style: textLabel,
                          children: [
                        TextSpan(
                            text: searchController.coverageType,
                            style: textLabel.copyWith(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold))
                      ])),
                  const SizedBox(
                    height: 15,
                  ),
                  const LeadInputs(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                        'Please select the services you\'re interested in:',
                        textAlign: TextAlign.center,
                        style: textLabel),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: serviceCheckboxes,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      CustomOutlinedButton(
                        onPressed: () async {
                          stepper.stepBack();
                        },
                        text: 'Back',
                      ),
                      const SizedBox(width: 15),
                      CustomFilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            customerInfo.createLead();
                            customerInfo.orderStatus(true);
                          }
                        },
                        text: 'Submit',
                      ),
                    ],
                  ),
                ]),
          ),
        ));
      },
    );
  }
}
