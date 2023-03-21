import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import '../../../../classes/participant.dart';
import '../../../../data/constants.dart';
import '../../../../providers/giveaway_controller.dart';
import '../../../buttons/custom_filled_button.dart';

class ShowWinnerView extends StatefulWidget {
  final Participant winner;
  const ShowWinnerView({Key? key, required this.winner}) : super(key: key);

  @override
  State<ShowWinnerView> createState() => _ShowWinnerViewState();
}

class _ShowWinnerViewState extends State<ShowWinnerView> {
  final confettiController = ConfettiController();

  @override
  void initState() {
    super.initState();
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF2e5899);
    const Color secondaryColor = Color(0xFFd20030);

    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 26);
    const Color labelColor = Color.fromARGB(255, 105, 137, 185);
    TextStyle textLabel = GoogleFonts.plusJakartaSans(
        color: labelColor, fontSize: 16, fontWeight: FontWeight.w400);

    final giveawayController = Provider.of<GiveawayController>(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          confettiController: confettiController,
          shouldLoop: true,
        ),
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: const [
                SizedBox(
                    height: 250,
                    width: 350,
                    child: RiveAnimation.asset('images/red_waves.riv')),
                SizedBox(
                    height: 250,
                    width: 250,
                    child: RiveAnimation.asset('images/winner_coin.riv')),
              ],
            ),
            Text("Congratulations!", style: textPrimary),
            Text(
                "${widget.winner.firstName.capitalizeSentence()} ${widget.winner.lastName.capitalizeSentence()}",
                style: textPrimary.copyWith(color: secondaryColor)),
            Text(widget.winner.email, style: textLabel),
            const SizedBox(
              height: 20,
            ),
            CustomFilledButton(
              onPressed: () async {
                giveawayController.searchStart();
              },
              text: 'Restart',
            ),
          ],
        ),
      ],
    );
  }
}
