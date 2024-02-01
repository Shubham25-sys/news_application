import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_const.dart';

class UpdateStyle{
  static TextStyle CustomeTextStyle(double fontSize, FontWeight fontWeight, Color color){
    return GoogleFonts.ibmPlexSerif(textStyle: TextStyle(fontSize: fontSize,fontWeight: fontWeight,color: color));
  }
}



