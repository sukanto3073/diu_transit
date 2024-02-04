import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Presentation_Layer/color_manager.dart';

class BusListView extends StatelessWidget {
  final String? busName;
  final String? driverName;
  final String? route;
  BusListView({required this.busName, required this.driverName, required this.route});


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return Container(
      height: screenSize.height/7,
      width: screenSize.width,
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: ColorManager.schedule_Container,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bus name: ${this.busName}",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("Driver name: ${this.driverName}",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("${this.route}",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],),
                Image(image: AssetImage('assete/images/map.png'))
              ],
            ),
          )

        ],
      ),
    );
  }
}
