import 'package:diu_transit/Presentation_Layer/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Presentation_Layer/color_manager.dart';
import 'bus_route.dart';
class TransportSchedule extends StatelessWidget {
  const TransportSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text("Transport Schedule"),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              height:screenSize.height/2.2,
              width: screenSize.width,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.schedule_Container,
              ),
              child: Padding(
                padding: EdgeInsets.only(left:10),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height:35,
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorManager.primary

                              ),
                              child: Center(child: Text("R1",style: TextStyle(color: ColorManager.white),)),
                            ),
                            Gap(10),
                            Text("Dhanmondi <> DSC",style: TextManager.route_name,)
                          ],
                        ),
                        InkWell(
                          onTap: (){
                             Get.to(SchedulePage(),transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 500) );
                          },
                          child: Icon(
                            Icons.map_rounded,
                            size: 30,
                            color: ColorManager.primary,
                          ),
                        )

                      ],
                    ),
                  ),
                  Text("Start Time(To DSC)"),
                    Gap(5),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorManager.primary,
                          ),
                          child: Center(child: Text("7:00 AM",style: TextManager.schedule_time,),),
                        ),
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorManager.primary,
                          ),
                          child: Center(child: Text("10:00 AM",style: TextManager.schedule_time,),),
                        ),
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorManager.primary,
                          ),
                          child: Center(child: Text("3:00 PM",style: TextManager.schedule_time,),),
                        ),

                      ],
                    ),
                    Gap(20),
                    Text("Departure Time(From DSC)"),
                    Gap(5),
                    Container(
                      padding: EdgeInsets.all(3),
                      constraints: BoxConstraints(
                        minWidth: screenSize.width/4.7,
                        //maxHeight:screenSize.height/27,
                       // maxWidth: screenSize.width/1.5,
                      ),
                      height: screenSize.height/27,
                      //width: screenSize.width/1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorManager.primary,
                      ),
                        //fit: BoxFit.contain,
                          child:  Padding(
                            padding:EdgeInsets.only(left: 8,right: 5),
                            child: Text("2:00:00 PM (Only for Students bus)",style: TextManager.schedule_time,),
                          ),
                    ),
                    Gap(10),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ColorManager.primary,
                          ),
                          child: Center(

                            child: Text("4:20 PM",style: TextManager.schedule_time,),
                          ),
                        ),
                        Gap(5),
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorManager.primary,
                          ),
                          child: Center(child: Text("6:00 PM",style: TextManager.schedule_time,),),
                        ),
                        Gap(5),
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorManager.primary,
                          ),
                          child: Center(child: Text("6:45 PM",style: TextManager.schedule_time,),),
                        ),
                        Gap(5),
                        Container(
                          height: screenSize.height/27,
                          width: screenSize.width/4.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ColorManager.primary,
                          ),
                          child: Center(child: Text("9:10 PM",style: TextManager.schedule_time,),),
                        ),


                      ],
                    ),
                    Gap(40),
                    Text("Dhanmondi - Sobhanbag <> Shyamoli Square <> Technical Mor > Majar Road Gabtoli <> Konabari Bus Stop <> Eastern Housing<> Rupnagar <> Birulia Bus Stand <> Daffodil Smart City")
                ],),
              ),
            ),
          ),

        ],
      ),

    ));
  }
}
