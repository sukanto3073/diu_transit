

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Session/session.dart';
import '../Url/url.dart';
import 'package:lottie/lottie.dart';
class DriverHomePage extends StatefulWidget {

    String? route_id;
    String? bus_id;
    DriverHomePage( { required this.route_id, required this.bus_id});




  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  Position? currentPosition;
  String? token;
  int? userId;
  var latitude;
  var longitude;
 /* getToken() async {
    await MyPrefs.getId().then((value) {
     var id = value;
     userId=id as int?;
    });
  }*/
  void Send_Driver_Location() async {
    print("Click");


    token = await MyPrefs.getToken();
    //userId= (await MyPrefs.getId())
    //print(token);


    String fullUrl = Urls.baseUrl + Urls.driver_location_send;
    Map<dynamic, dynamic> data = {
      'lat': latitude.toString(),
      'long': longitude.toString(),
      'bus_id': widget.bus_id!,
      'route_id': widget.route_id!,
     // 'user_id': userId,
    };
    Map<String, String> setHeaders = {
      'Accept': 'application/json',
      "Authorization": "bearer ${token}",

    };

    PermissionStatus locationPermission=await Permission.location.request();
    if(locationPermission==PermissionStatus.granted){
      var response =
      await http.post(Uri.parse(fullUrl),body: data,headers: setHeaders);

      //print(response.statusCode);
     // print(response.body);

      if (response.statusCode == 200) {
        var data =jsonDecode(response.body);
        var lats=data['data']['lat'];
        var longs=data['data']['long'];
        //print("Lat---------------:${lat}");
        //print("long---------------:${long}");

        MyPrefs.setlat(lats.toString());
        MyPrefs.setlong(longs.toString());

        print(response.body.toString());

      }
    } else {


    }


  }
  void getCurrentLocation() async {
    PermissionStatus locationPermission=await Permission.location.request();
    if(locationPermission==PermissionStatus.granted){
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        // print("latitude :${position.latitude}");
        // print("longitude :${position.longitude}");

        setState((){
          latitude=position.latitude;
          longitude=position.longitude;
           //Send_Driver_Location();
        });

        var latitude_old=await MyPrefs.getLat();
        var longitude_old=await MyPrefs.getlong();
        print("Old_data--------${latitude_old}----${longitude_old}");
        if(latitude_old==latitude.toString() || longitude_old==longitude.toString()){
          print("same data");
        }else{
          Send_Driver_Location();
        }
      }).catchError((e) {
        print(e);
      });
    }
    else if(locationPermission==PermissionStatus.denied){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text("This permission is recommended")));
    }
    else if(locationPermission==PermissionStatus.permanentlyDenied){

    }else if(locationPermission==PermissionStatus.restricted){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text("This permission is recommended")));
    }


  }

  //final databaseRef= FirebaseDatabase.instance.ref('table');
  //final controller = Get.put(DriverController());
  Future<void>trackme()async {
    Timer.periodic(Duration(seconds: 10), (timer) {
      if(select==true){
        getCurrentLocation();
        //Send_Driver_Location();

      }else{
        timer.cancel();
      }


      print("latitude>>>>>>>>>>>:${latitude}");
      print("longitude>>>>>>>>>>>:${longitude}");

    });
  }

  @override
  void initState() {
    //getToken();
    if(select==false){
      getCurrentLocation();
    }
    //getCurrentLocation();
    //trackme();
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit page'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () {
    Navigator.of(context).pop(true);
    setState(() {
      select=false;
    });
    },
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  bool select =false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text("Home page",style: TextStyle(color: Colors.white),),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                select==true?Container(
                    height: screenSize.height/3.7,
                    width: screenSize.width,
                    child: Lottie.asset("assete/lottie_image/bus_data_send.json")
                ):Container(),

                select==false?InkWell(
                  onTap:() {
                    setState(() {
                      select=true;
                      trackme();
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

                      select=false;
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
                select==true?Container(
                    height: screenSize.height/3.7,
                    width: screenSize.width,
                    child: Lottie.asset("assete/lottie_image/bus.json")
                ):Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assete/images/driver.png"),
                ),

              ],
            ),
          )
      ),
    );


       



  }
}
