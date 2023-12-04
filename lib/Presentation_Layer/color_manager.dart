import 'package:flutter/material.dart';

class ColorManager{
  static Color primary =HaxColor.fromHex("#4DC515");
  static Color white =HaxColor.fromHex("#FFFFFF");
  static Color gray =HaxColor.fromHex("#F5F5F5");
  static Color choose_area =HaxColor.fromHex("#404040");
  static Color note =HaxColor.fromHex("#FF1818");
  static Color select_area =HaxColor.fromHex("#404040");
  static Color login_box_color =HaxColor.fromHex("#F5F5F5");
  static Color text_box_color =HaxColor.fromHex("#BDBDBD");
  static Color schedule_Container =HaxColor.fromHex("#ECECEC");
  static LinearGradient button_color= LinearGradient(
    colors: [
      HaxColor.fromHex("#51CE4E"),
      HaxColor.fromHex("#399A0C")
    ],
  );
}

extension HaxColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length==6){
      hexColorString ="FF" + hexColorString;
    }
    return Color(int.parse(hexColorString,radix: 16));
  }
}