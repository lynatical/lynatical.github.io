import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/ui/views/forms/lead_info_form_view.dart';

import '../../providers/stepper_controller.dart';
import 'forms/address_form_view.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepper = Provider.of<StepperController>(context);
    const Color primaryColor = Color(0xFF2e5899);
    const Color labelColor = Color(0xFF8aa7d2);

    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 18);

    TextStyle textLabel = GoogleFonts.plusJakartaSans(color: labelColor);

    return Theme(
      data: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.blue,
            ),
      ),
      child: Stepper(
        currentStep: stepper.index,
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return const SizedBox.shrink();
        },
        steps: <Step>[
          Step(
            state: stepper.index > 0 ? StepState.complete : StepState.indexed,
            isActive: stepper.index >= 0,
            title: Text(
              'Step 1: Address',
              style: textPrimary,
            ),
            subtitle:
                Text("Please provide your full address", style: textLabel),
            content: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: const [
                    AddressFormView(),
                  ],
                )),
          ),
          Step(
            state: stepper.index > 1 ? StepState.complete : StepState.indexed,
            isActive: stepper.index >= 1,
            title: Text('Step 2: Personal Details', style: textPrimary),
            content: const LeadFormView(),
          ),
        ],
      ),
    );
  }
}
