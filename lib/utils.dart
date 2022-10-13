import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

List selectableTimes = [
  '10',
  '20',
  '30',
  '40',
  '50',
  '60',
  '70',
  '80',
  '90',
  '100',
  '110',
  '120',
];

Color renderColor(String currentState) {
  if (currentState == 'FOCUS') {
    return Colors.redAccent;
  } else {
    return Colors.blueAccent;
  }
}
