

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class DriverHomePage extends StatefulWidget {



  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  //final databaseRef= FirebaseDatabase.instance.ref('table');


  _getCurrentLocation() async {
    PermissionStatus locationPermission=await Permission.location.request();

    if(locationPermission==PermissionStatus.granted){
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        print("latitude :${position.latitude}");
        print("longitude :${position.longitude}");

        setState(() {
          //lat=position.latitude;
          //log=position.longitude;
          // Store the position in the variable
          // print('CURRENT POS: $_currentPosition');
          // For moving the camera to current location

        });
      }).catchError((e) {
        print(e);
      });
    }
    if(locationPermission==PermissionStatus.denied){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text("This permission is recommended")));
      openAppSettings();
    }
    if(locationPermission==PermissionStatus.permanentlyDenied){
      openAppSettings();
    }


  }
  @override
  void initState() {
    if(select==true){
      _getCurrentLocation();
    }

    // TODO: implement initState
    super.initState();
  }

  bool select =false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Home page"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              select==false?InkWell(
                onTap:() {
                  setState(() {
                    _getCurrentLocation();
                    select =true;
                  });
                },
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(child:
                    Text("off",
                      style: TextStyle(fontSize: 40,color: Colors.white),
                    ),
                    ),
                  ),
                ),
              ):InkWell(
                onTap:() {
                  setState(() {

                    select =false;
                  });
                },
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: Center(child:
                    Text("on",
                      style: TextStyle(fontSize: 40,color: Colors.white),
                    ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 250,
                width: 250,
                child: Image.asset("assete/images/driver.png"),
              )
            ],
          ),
        )
    );
  }
}
