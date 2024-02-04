import 'package:diu_transit/Presentation_Layer/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Controller/schedule_controller.dart';
import '../Presentation_Layer/color_manager.dart';
import 'bus_route.dart';
class TransportSchedule extends StatelessWidget {
  const TransportSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GetBuilder<ScheduleController>(
      init: ScheduleController(),
      builder: (ScheduleController controller) {
        var data= controller.scheduleList.value.data;
        return SafeArea(child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Text("Transport Schedule"),
            leading: BackButton(
              color: Colors.black,
            ),
          ),
          body: controller.isLoading.value
              ?  const Center(
              child: CircularProgressIndicator()
          ):
          ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                  child: Container(
                    height:screenSize.height/2.4,
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
                                      child: Center(child: Text("R${index+1}",style: TextStyle(color: ColorManager.white),)),
                                    ),
                                    Gap(10),
                                    Text("${data[index].routeCode}",style: TextManager.route_name,)
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(SchedulePage(url: data[index].routeMapUrl,),transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 500) );
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
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                               shrinkWrap: true,
                                itemCount: data[index].startTimeSlot!.length,
                                itemBuilder: ( BuildContext context, int slote) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 30,top: 10,left: 5,right: 5),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minWidth: screenSize.width/4.7,
                                        maxHeight:screenSize.height/27,
                                        //maxWidth: screenSize.width/1.5,
                                      ),
                                      height: screenSize.height/27,
                                      width: screenSize.width/4.7,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: ColorManager.primary,
                                      ),
                                      child: Center(

                                        child: Text(data[index].startTimeSlot![slote],style: TextManager.schedule_time,),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),
                          Text("Departure Time(From DSC)"),
                          Gap(5),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: data[index].departureTimeSlot!.length,
                                itemBuilder: ( BuildContext context, int slote) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 40,left: 5,right: 5),
                                    child: Container(
                                      height: screenSize.height/27,
                                      width: screenSize.width/4.7,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: ColorManager.primary,
                                      ),
                                      child: Center(

                                        child: Text(data[index].departureTimeSlot![slote],style: TextManager.schedule_time,),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),
                          //Gap(40),
                          Text("Dhanmondi - Sobhanbag <> Shyamoli Square <> Technical Mor > Majar Road Gabtoli <> Konabari Bus Stop <> Eastern Housing<> Rupnagar <> Birulia Bus Stand <> Daffodil Smart City")
                        ],),
                    ),
                  ),
                );
              },
            ),


        ));
      },
    );



  }
}
