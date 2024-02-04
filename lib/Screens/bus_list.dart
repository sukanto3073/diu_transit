

import 'package:diu_transit/Presentation_Layer/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../Controller/active_bus_controller.dart';
import '../CustomWidget/bus_list.dart';
import '../Presentation_Layer/text_size_manager.dart';
import 'google_map.dart';

class BusList extends StatefulWidget {
  int? route_id;
  String? route_name;


  BusList( { required this.route_id,required this.route_name } );



  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  final controller = Get.put(ActiveBusController());

  @override
  void initState() {
    controller.ActiveBus_data(widget!.route_id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return GetBuilder<ActiveBusController>(
      init: ActiveBusController(),
      builder: (ActiveBusController controller) {
        var data= controller.activeBusList.value.data;
        return SafeArea(child: Scaffold(
          appBar:AppBar(
            leading: BackButton(
              color: ColorManager.white,
            ),
            backgroundColor: ColorManager.primary,
            title: Center(child: Text("Bus list",style: TextStyle(color: ColorManager.white),)),
          ),
          body:
          controller.isLoading.value
              ?  const Center(
              child: CircularProgressIndicator()
          ):
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text("${widget.route_name} Bus",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                Gap(10),
                controller.activeBusList.value.data!.isEmpty? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Image.asset("assete/images/bus_find.jpg"),
                      ),
                    Text("There aren't any buses operating right now.")
                  ],
                )
                :

                Expanded(
                  child: ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(() => MapPage(bus_id: data![index].busId, route_id: data![index].routeId, lat: data![index].lastLat, long: data![index].lastLong,));
                            //Get.to(MapPage(bus_id: data![index].busId, route_id: data![index].routeId,),transition: Transition.fadeIn,);
                          },
                          child: BusListView(
                            busName: data![index].busName,
                            driverName:data![index].driverName ,
                            route: data![index].routeCode,
                          ),
                        ),
                      );
                    },
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
