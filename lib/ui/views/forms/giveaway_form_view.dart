import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/ui/views/widgets/lead_inputs.dart';
import '../../../providers/customer_info_controller.dart';
import '../../buttons/custom_filled_button.dart';

class GiveawayFormView extends StatefulWidget {
  const GiveawayFormView({Key? key}) : super(key: key);

  @override
  State<GiveawayFormView> createState() => _GiveawayFormViewState();
}

class _GiveawayFormViewState extends State<GiveawayFormView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //Controllers
    final customerInfo = Provider.of<CustomerInfoProvider>(context);

    const Color primaryColor = Color(0xFF2e5899);

    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 18);

    return Builder(
      builder: (context) {
        return Center(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Please enter your details.", style: textPrimary),
                  const SizedBox(height: 15),
                  const LeadInputs(),
                  const SizedBox(height: 15),
                  CustomFilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        customerInfo.createGiveawayLead();
                        customerInfo.orderStatus(true);
                      }
                    },
                    text: 'Submit',
                  ),
                ]),
          ),
        ));
      },
    );
  }
}
