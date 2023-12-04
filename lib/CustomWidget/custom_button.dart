import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String button_name;
  const CustomButton({super.key, required this.button_name});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return Container(
      alignment: Alignment.center,
      height: screenSize.height/16,
      width: screenSize.width/2.8,
      decoration: BoxDecoration(
        gradient: ColorManager.button_color,
        borderRadius: BorderRadius.circular(50),

        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE)),
        ],
      ),
      child: Text(
        "${widget.button_name}",
        style: TextStyle(color:ColorManager.white,fontFamily:fontFamaliy,fontWeight: FontWeight.bold,fontSize: 18.0),
      ),
    );
  }
}
