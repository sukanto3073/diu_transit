

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:diu_transit/Presentation_Layer/color_manager.dart';

class TextManager{
 static var fontFamaliy="OpenSans";
  static TextStyle route_name = TextStyle(color: Colors.black,fontWeight: FontWeight.bold);
  static TextStyle schedule_time = TextStyle(color: Colors.white,fontSize: 15);
  static TextStyle login_select = TextStyle(fontFamily: fontFamaliy,fontWeight: FontWeight.bold,fontSize: 20,color: ColorManager.white);
}