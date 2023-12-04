

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;



import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  /*var lat='23.6071659';
  var log='89.6177496';

  MapPage(this.lat, this.log);*/

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double lat=23.6071659;
  double log=89.6177496;

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController? mapController;

  _getCurrentLocation() async {
    PermissionStatus locationPermission = await Permission.location.request();
    final Uint8List? personIcon = await getBytesFromAsset(
        'assete/images/user.png', 140);
    if (locationPermission == PermissionStatus.granted) {
      await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        setState(() {
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
          setState(() {
            markers.add(startMarker);
          });
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

  Set<Marker> markers = {};


  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer
        .asUint8List();
  }


  //LatLng endLocation=LatLng(23.756242, 90.375461);



  addMarker() async {
    final Uint8List? markerIcon = await getBytesFromAsset(
        'assete/images/home.png', 120);
    Marker endtMarker = Marker(
      markerId: MarkerId("2"),
      position: LatLng(lat, log),
      infoWindow: InfoWindow(
        title: 'end',
      ),
      icon: BitmapDescriptor.fromBytes(markerIcon!),
    );
    setState(() {
      markers.add(endtMarker);
    });
  }

  @override
  initState() {
    _getCurrentLocation();



    addMarker();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GoogleMap(
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        markers: Set<Marker>.from(markers),
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ), // GoogleMap

    );
  }
}









