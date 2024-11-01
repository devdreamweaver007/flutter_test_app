import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle mainFont(
    {required double fontsize,
    required FontWeight fontweight,
    required Color color}) {
  return GoogleFonts.poppins(
      fontSize: fontsize, fontWeight: FontWeight.bold, color: color,);
}

TextStyle normalFont(
    {required double fontsize,
    required FontWeight fontweight,
    required Color color}) {
  return GoogleFonts.figtree(
      fontSize: fontsize, fontWeight: FontWeight.bold, color: color,);
}
TextStyle normalFont1(
    {required double fontsize,
    required FontWeight fontweight,
    required Color color}) {
  return GoogleFonts.figtree(
      fontSize: fontsize, fontWeight: FontWeight.bold, color: color,fontStyle: FontStyle.italic );
}

