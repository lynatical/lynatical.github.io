import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rta_map_services/data/constants.dart';

import '../../../../classes/participant.dart';

class ParticipantsList extends StatelessWidget {
  final List<Participant> participants;
  const ParticipantsList({Key? key, required this.participants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    const Color primaryColor = Color(0xFF2e5899);
    const Color labelColor = Color.fromARGB(255, 105, 137, 185);
    TextStyle textLabel = GoogleFonts.plusJakartaSans(
        color: labelColor, fontSize: 18, fontWeight: FontWeight.w400);
    TextStyle textDisclaimer = GoogleFonts.plusJakartaSans(
        color: labelColor, fontSize: 14, fontWeight: FontWeight.w300);
    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 26);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            spreadRadius: -15,
            color: primaryColor.withOpacity(0.4),
            offset: const Offset(0, 45),
          ),
          BoxShadow(
            blurRadius: 50,
            spreadRadius: -25,
            color: primaryColor.withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Contestants", style: textPrimary),
          SizedBox(
            height: 300,
            child: Scrollbar(
              thumbVisibility: true,
              controller: controller,
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemCount: participants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: (index + 1).toString(),
                            style: textLabel.copyWith(
                                color: primaryColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 14),
                            children: [
                              TextSpan(
                                text:
                                    "   ${participants[index].firstName.capitalizeSentence()} ${participants[index].lastName.capitalizeSentence()}",
                                style: textLabel,
                              )
                            ]),
                      ),
                      Divider(height: 30, color: labelColor.withOpacity(0.25))
                    ],
                  );
                },
              ),
            ),
          ),
          Text(
            "total: ${participants.length}",
            style: textDisclaimer,
          )
        ],
      ),
    );
  }
}
