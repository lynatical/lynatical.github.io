import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class SubmittedView extends StatelessWidget {
  const SubmittedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF2e5899);
    const Color labelColor = Color(0xFF8aa7d2);

    TextStyle textPrimary = GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w700, color: primaryColor, fontSize: 18);

    TextStyle textLabel = GoogleFonts.plusJakartaSans(color: labelColor);

    return Column(
      children: [
        const SizedBox(
            height: 250,
            width: 250,
            child: RiveAnimation.asset('assets/images/success.riv')),
        Text("Your data has been sucessfully submitted!", style: textPrimary)
      ],
    );
  }
}
