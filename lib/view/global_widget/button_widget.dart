import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class Buttonwidget extends StatelessWidget {
  final String text;
  const Buttonwidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '$text',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      width: 220,
      height: 44,
      decoration: BoxDecoration(
        color: ColorConstants.primarycolor,
      ),
    );
  }
}
