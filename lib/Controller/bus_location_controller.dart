

import 'dart:convert';


import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import '../Model/active_bus_list_model.dart';
import '../Model/bus_location_model.dart';
import '../Model/route_list_model.dart';
import '../Session/session.dart';
import '../Url/url.dart';

class BusLocationController extends GetxController {

  var busLocation = BusLocationModel().obs;
  var isLoading = false.obs;
  String? token;
  List<Marker> allMarkers = <Marker>[].obs; // Inside Map View Controller
  double? lat;
  double?long;

  final CameraPosition initialLocation = CameraPosition(target: LatLng(0.0,0.0));
  GoogleMapController? mapController;

  _getCurrentLocation() async {
    PermissionStatus locationPermission = await Permission.location.request();
    final Uint8List? personIcon = await getBytesFromAsset(
        'assete/images/user_map.png', 130);
    if (locationPermission == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {


          print('${position.latitude}-------------${position.longitude}');
          mapController!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(busLocation.value.data!.lat!, busLocation.value.data!.long!),
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
          allMarkers.add(startMarker);
          update();
          /* setState(() {
            markers.add(startMarker);
          });*/

      }).catchError((e) {
        print(e);
      });
    }else{
      //Navigator.of(context).pop();
    }
    if (locationPermission == PermissionStatus.denied) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      // Text("This permission is recommended")));
      openAppSettings();
    }
    if (locationPermission == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer
        .asUint8List();
  }
  addMarker(double lat,double long) async {
    final Uint8List? markerIcon = await getBytesFromAsset(
        'assete/images/bus_map.png', 120);
    Marker endtMarker = Marker(
      markerId: MarkerId("2"),
      position: LatLng(lat,long),
      infoWindow: InfoWindow(
        title: 'end',
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon!),
    );
    allMarkers.add(endtMarker);
    update();

  }
  @override
  void onInit() {
    _getCurrentLocation();
    //addMarker(lat!,long!);

    // TODO: implement onInit
    super.onInit();
  }





  void BusLocation_Data(String? busId,String? routeId) async {
    isLoading.value = true;
    update();
    token = await MyPrefs.getToken();


    String fullUrl = Urls.baseUrl + Urls.bus_location;
    Map<String, String> data = {
      'bus_id': busId!,
      'route_id': routeId!
    };

    Map<String, String> setHeaders = {
      'Accept': 'application/json',
      "Authorization": "bearer ${token}",

    };
    var response =
    await http.post(Uri.parse(fullUrl), body: data, headers: setHeaders);
    print(response.statusCode);
    if (response.statusCode == 200) {
      BusLocationModel data = BusLocationModel.fromJson(jsonDecode(response.body));
      if (data.error == false) {
        print(response.body.toString());
        addMarker(data.data!.lat!,data.data!.long!);
        update();
        lat=data.data!.lat!;
        long=data.data!.long!;
        addMarker(data.data!.lat!,data.data!.long!);
        busLocation.value=data;
        isLoading.value = false;
        update();
      }
    } else {
      isLoading.value = false;
      update();
    }
  }




}