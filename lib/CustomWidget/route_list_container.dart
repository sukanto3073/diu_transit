import 'package:flutter/cupertino.dart';

import '../Presentation_Layer/color_manager.dart';
import '../Presentation_Layer/text_size_manager.dart';

class RouteList extends StatefulWidget {
  String? routeName;
  int? totalBus;
  int? activeBus;
  String? routeCode;

  RouteList({ required this.routeName,required this.totalBus, required this.activeBus,required this.routeCode});



  @override
  State<RouteList> createState() => _RouteListState();
}

class _RouteListState extends State<RouteList> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return Container(
      height: screenSize.height/6.4,
      width: screenSize.width/2.5,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorManager.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(" ${widget.routeCode}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
              fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),
          Text("${widget.routeName}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
              fontFamily: fontFamaliy,color: ColorManager.white),
            textScaleFactor: TextSize.textScaleFactor(context),
          ),
          Text("Total bus : ${widget.totalBus}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
              fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),
          Text("Active ${widget.activeBus}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
              fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),


        ],
      ),
    );
  }
}
