import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  final String text;
  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFFD20030),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: GoogleFonts.workSans(
            fontSize: 13,
            height: 1.5,
            color: const Color(0xff2E5899),
            fontWeight: FontWeight.w400,
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
