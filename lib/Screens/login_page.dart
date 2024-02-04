import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:diu_transit/Screens/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';
import '../Controller/auth_controller.dart';
import '../CustomWidget/custom_button.dart';
import '../CustomWidget/custom_textformfield.dart';
import '../Presentation_Layer/text_size_manager.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final String user;

  LoginPage({ required this.user});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (AuthController controller) {
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
                Text("Wellcome To Our",
                  style: TextStyle(fontFamily: fontFamaliy,fontSize: 28,
                    fontWeight: FontWeight.bold,color: ColorManager.white,),
                  textScaleFactor: TextSize.textScaleFactor(context),
                ),

                Text("Login Page",
                  style: TextStyle(fontFamily: fontFamaliy,fontSize: 28,
                      fontWeight: FontWeight.bold,color: ColorManager.white),
                  textScaleFactor: TextSize.textScaleFactor(context),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: screenSize.height/2.3,
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
                        key: controller.loginFormKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              keybordType: TextInputType.emailAddress,
                              controller: controller.usernameController,
                              hintText: widget.user=='student'?"Enter your email":"Enter phone number",
                              top: 40.0,
                            ),
                            CustomTextFormField(
                              keybordType: TextInputType.visiblePassword,
                              controller: controller.loginpasswordController,
                              hintText: "Enter your password",
                              top: 20.0,
                            ),
                            Gap(25),
                            controller.isLoading.value
                                ? const CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 3.0,
                            ):
                            InkWell(
                              onTap: (){
                                if(controller.loginFormKey.currentState!.validate()){
                                  controller.Login_Data();
                                }
                               /* Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage()),
                                );*/
                              },
                              child:CustomButton(button_name: 'Login',),
                            ),
                            Gap(15),
                           widget.user=='student'? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Don’t have a Account?',style: TextStyle(color: Colors.black),),

                                InkWell(
                                    onTap: (){

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const RegistrationPage()),
                                      );
                                    },
                                    child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold,color: ColorManager.primary)
                                      ,)
                                ),
                              ],
                            ):Container()

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
                )
              ],
            ),
          ),
        ));
      },
    );



  }
}
