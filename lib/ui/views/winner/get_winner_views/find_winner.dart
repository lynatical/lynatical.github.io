import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/providers/giveaway_controller.dart';

import '../../../buttons/custom_filled_button.dart';

class FindWinnerView extends StatelessWidget {
  const FindWinnerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF2e5899);
    const Color labelColor = Color.fromARGB(255, 105, 137, 185);
    TextStyle textLabel = GoogleFonts.plusJakartaSans(
        color: labelColor, fontSize: 18, fontWeight: FontWeight.w400);
    TextStyle textDisclaimer = GoogleFonts.plusJakartaSans(
        color: labelColor, fontSize: 14, fontWeight: FontWeight.w300);
    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 26);

    final giveawayController = Provider.of<GiveawayController>(context);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Pick the possible Winner of the Giveaway!",
            style: textPrimary,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFilledButton(
            onPressed: () async {
              giveawayController.searchStart();
            },
            text: 'Find Winner',
          ),
        ],
      ),
    );
  }
}
