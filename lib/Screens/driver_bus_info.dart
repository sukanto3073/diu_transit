import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../Controller/driver_controller.dart';
import '../CustomWidget/custom_button.dart';
import '../Presentation_Layer/color_manager.dart';
import 'driver_home_page.dart';

class Driver_Info extends StatefulWidget {
  const Driver_Info({super.key});

  @override
  State<Driver_Info> createState() => _Driver_InfoState();
}

class _Driver_InfoState extends State<Driver_Info> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (DriverController controller) {
        var data= controller.driverInfo.value.data;
        return SafeArea(child: Scaffold(
          appBar: AppBar(
            title: Text('Information',style: TextStyle(color: ColorManager.white),),
            centerTitle: true,
            backgroundColor: ColorManager.primary,
            actions: [
              IconButton(
                  onPressed: (){
                  controller.removeValues();
                  },
                tooltip: 'Logout',
                  icon: Icon(Icons.logout,color: Colors.white,),
              )

            ],
          ),
          backgroundColor:Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          controller.isLoading.value
          ?  const Center(
              child: CircularProgressIndicator()
        ):
              Center(
                child: Container(
                  height: screenSize.height/2.1,
                  width: screenSize.width/1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Color(0xFFF5F6F9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,


                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Bus Name :"),
                            Text("${data!.busName}")
                          ],),
                        Row(
                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Bus Number :"),
                            Text("${data!.busNumber}")
                          ],),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Route Name :"),
                            Text("${data!.routeName}")
                          ],),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Route Code :"),
                            Text("${data!.routeCode}")
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Text("${data!.routeDetails}"))
                          ],),
                        InkWell(
                          onTap: (){
                            Get.to(DriverHomePage(route_id: data!.routeId, bus_id: data!.busId,),transition: Transition.downToUp,duration: Duration(seconds: 1));
                          },
                            child: CustomButton(button_name: 'Next',)
                        ),

                      ],),
                  ),
                ),
              ),

            ],),
        ));
      },
    );




  }
}
