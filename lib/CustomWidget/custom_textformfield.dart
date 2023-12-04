import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
 // final TextEditingController controller;
  final String hintText;

  final double top;
  TextInputType keybordType=TextInputType.text;
  CustomTextFormField({
    Key? key,
   // required this.controller,
    required this.hintText,

    required this.top,
    required this.keybordType,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _showError = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height/15,
      width: screenSize.width/1.3,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            //spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: widget.top),


      alignment: Alignment.center,
      child: Center(
        child: TextFormField(

          keyboardType: widget.keybordType,
          //controller: widget.controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                _showError = true;
              });
              return 'Please ${widget.hintText}';
            }
            setState(() {
              _showError = false;
            });
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.text_box_color.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),

            // suffixIcon: Padding(
            //   padding: const EdgeInsets.only(right: 10.0),
            //   child: Icon(
            //     Icons.remove_red_eye,
            //     color: Color(0xfff5591f),
            //   ),
            // ),
            contentPadding: EdgeInsets.all(20.0),
            labelText: widget.hintText,
          ),
        ),
      ),
    );
  }
}
