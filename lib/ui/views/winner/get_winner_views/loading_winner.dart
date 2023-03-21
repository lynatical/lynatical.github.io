import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rta_map_services/providers/giveaway_controller.dart';
import 'package:rta_map_services/ui/views/winner/get_winner_views/show_winner.dart';

import '../../../../classes/participant.dart';
import '../../widgets/spinner.dart';

class LoadWinnerView extends StatelessWidget {
  const LoadWinnerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final giveawayController = Provider.of<GiveawayController>(context);

    const Color primaryColor = Color(0xFF2e5899);

    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 24);

    return FutureBuilder<Participant>(
        future: giveawayController.getWinner(),
        builder: (BuildContext context, AsyncSnapshot<Participant> snapshot) {
          Widget testText;

          if (snapshot.hasData) {
            testText = ShowWinnerView(winner: snapshot.data!);
          } else if (snapshot.hasError) {
            testText =
                const Text("There was an error during the data transfer");
          } else {
            testText = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spinner(),
                Text("Selecting the winner...", style: textPrimary)
              ],
            );
          }
          return Center(child: testText);
        });
  }
}
