import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../CustomWidget/custom_button.dart';
import '../CustomWidget/custom_textformfield.dart';
import '../Presentation_Layer/text_size_manager.dart';
import 'home_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return  SafeArea(child: Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        child: Column(
          /* mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,*/
          children: [
            Center(
              child: Container(
                  height: screenSize.height/3.7,
                  width: screenSize.width,
                  child: Lottie.asset("assete/lottie_image/bus.json")),
            ),
            Text("Registration",
              style: TextStyle(fontFamily: fontFamaliy,fontSize: 28,
                fontWeight: FontWeight.bold,color: ColorManager.white,),
              textScaleFactor: TextSize.textScaleFactor(context),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  height: screenSize.height/1.8,
                  width: screenSize.width/1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: ColorManager.login_box_color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                    child: Form(
                      child: Column(
                        children: [
                          CustomTextFormField(
                            keybordType: TextInputType.emailAddress,
                            //controller: controller.usernameController,
                            hintText: "Enter your name",
                            top: 50.0,
                          ),
                          CustomTextFormField(
                            keybordType: TextInputType.emailAddress,
                            //controller: controller.usernameController,
                            hintText: "Enter your email",
                            top: 20.0,
                          ),
                          CustomTextFormField(
                            keybordType: TextInputType.emailAddress,
                            //controller: controller.usernameController,
                            hintText: "Enter your mobile number",
                            top: 20.0,
                          ),
                          CustomTextFormField(
                            keybordType: TextInputType.emailAddress,
                            //controller: controller.usernameController,
                            hintText: "Enter your password",
                            top: 20.0,
                          ),
                          Gap(25),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage()),
                              );
                            },
                            child:CustomButton(button_name: 'Sign Up',),
                          ),



                          /*Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Don’t have a Account?',style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(fontWeight: FontWeight.bold,color: ColorManager.primary),
                                ),

                              ],
                            ),
                          ),*/

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
