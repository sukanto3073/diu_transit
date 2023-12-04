import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:diu_transit/Presentation_Layer/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../Presentation_Layer/text_size_manager.dart';
import 'driver_home_page.dart';
import 'google_map.dart';
import 'login_page.dart';

class UserSelect extends StatefulWidget {
  const UserSelect({super.key});

  @override
  State<UserSelect> createState() => _UserSelectState();
}

class _UserSelectState extends State<UserSelect> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return SafeArea(child: Scaffold(
      //backgroundColor: ColorManager.gray,
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[

          //Diu bus background image
          Container(
                   decoration: const BoxDecoration(
                   image: DecorationImage(
                    image: AssetImage(
                        'assete/images/diu_transport.jpg'),
                    fit: BoxFit.fill,
                  ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150),bottomRight: Radius.circular(150)),

                ),
                  height: screenSize.height/2,
                    width: screenSize.width,
                 ),
          const Gap(40),
          //Login as a driver button
          InkWell(
            onTap: (){
              Get.to(DriverHomePage(),transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 1500));
            },
            child: Container(
              height: screenSize.height/14,
              width: screenSize.width/1.5,
              decoration:   BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: ColorManager.button_color,
              ),
              child: Center(
                child: Text(
                  'Login as a driver',
                  style: TextManager.login_select,
                  textScaleFactor: TextSize.textScaleFactor(context),
                ),
              ),

            ),
          ),
          const Gap(20),
          //Login as a student button
          InkWell(
            onTap: (){
             // Get.to(MapPage(),transition: Transition.downToUp,duration: Duration(seconds: 2));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Container(
              height: screenSize.height/14,
              width: screenSize.width/1.5,
              decoration:   BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: ColorManager.button_color,
              ),
              child: Center(
                child: Text(
                  'Login as a student',
                  style: TextManager.login_select,
                  textScaleFactor: TextSize.textScaleFactor(context),
                ),
              ),

            ),
          ),
        ],
      ),
    ));
  }
}
