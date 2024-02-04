

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Controller/bus_location_controller.dart';
import '../Model/bus_location_model.dart';
import '../Session/session.dart';
import '../Url/url.dart';

class MapPage extends StatefulWidget {
 String? bus_id;
 String? route_id;
 String? lat;
 String? long;


 MapPage( { required this.bus_id, required this.route_id ,required this.lat, required this.long} );

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController? mapController;
  String? token;
  _getCurrentLocation() async {
    PermissionStatus locationPermission = await Permission.location.request();
    final Uint8List? personIcon = await getBytesFromAsset(
        'assete/images/user_map.png', 130);
    if (locationPermission == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {

        setState(() {
          print('${position.latitude}-------------${position.longitude}');
          mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 13.5,

              ),
            ),
          );

          Marker startMarker = Marker(
            markerId: MarkerId("1"),
            position: LatLng(position.latitude, position.longitude),

            infoWindow: InfoWindow(
              title: 'Start',

            ),
            icon: BitmapDescriptor.fromBytes(personIcon!),
          );
          controller.allMarkers.add(startMarker);
         /* setState(() {
            markers.add(startMarker);
          });*/
        });
      }).catchError((e) {
        print(e);
      });
    }else{
      Navigator.of(context).pop();
    }
    if (locationPermission == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text("This permission is recommended")));
      openAppSettings();
    }
    if (locationPermission == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  //Set<Marker> markers = {};


  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer
        .asUint8List();
  }




  final controller = Get.put(BusLocationController());
   //LatLng endLocation=LatLng(controller.busLocation.value.data!.lat!,controller.busLocation.value.data!.long!);
  /*addMarker() async {
    final Uint8List? markerIcon = await getBytesFromAsset(
        'assete/images/bus_map.png', 130);
    Marker endtMarker = Marker(
      markerId: MarkerId("2"),
      position: LatLng(double.parse(widget.lat!),double.parse(widget.long!)),
      infoWindow: InfoWindow(
        title: 'end',
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon!),
    );
    setState(() {
      markers.add(endtMarker);
    });
  }*/

  Future<void>trackme()async {
    Timer.periodic(Duration(seconds: 10), (timer) {
      controller.BusLocation_Data(widget.bus_id, widget.route_id);
    });
  }

 /* BusLocation_Data() async {
    setState(() {
      isLoading=true;
    });
    token = await MyPrefs.getToken();
    String fullUrl = Urls.baseUrl + Urls.bus_location;
    Map<String, String> data = {
      'bus_id': widget.bus_id!,
      'route_id': widget.route_id!
    };
   print("Token________________________${token}");
    Map<String, String> setHeaders = {
      'Accept': 'application/json',
      "Authorization": "bearer ${token}",

    };
    var response =
    await http.post(Uri.parse(fullUrl), body: data, headers: setHeaders);
   // print(response.body.toString());
    //print(response.statusCode);
    if (response.statusCode == 200) {
      BusLocationModel data = BusLocationModel.fromJson(jsonDecode(response.body));
      if (data.error == false) {
        print(response.statusCode);
        print(response.body.toString());

          lat= data.data!.lat as double;
          log= data.data!.long as double;


        isLoading = false;
      }
    } else {
      setState(() {
        isLoading=false;
      });
       isLoading.value = false;
        update();
    }
  }*/


  @override
  initState() {
    //trackme();
    controller.BusLocation_Data(widget.bus_id, widget.route_id);
    //_getCurrentLocation();
    //addMarker();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return GetBuilder<BusLocationController>(
      init: BusLocationController(),
      builder: (BusLocationController controller) {
        return Scaffold(
          body:
          controller.isLoading.value
              ?   Center(
              child: CircularProgressIndicator()
          ):
          GoogleMap(
            initialCameraPosition:controller.initialLocation,
            myLocationEnabled: true,
            markers: Set<Marker>.from(controller.allMarkers),
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controllers) {
             controller.mapController = controllers;
            },
          ), // GoogleMap

        );
      },
    );




  }
}









