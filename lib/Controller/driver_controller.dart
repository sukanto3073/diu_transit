
import 'dart:convert';
import 'dart:ffi';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/driver_info_model.dart';
import '../Screens/user_select.dart';
import '../Session/session.dart';
import '../Url/url.dart';

class DriverController extends GetxController {
  var isLoading = false.obs;
  var driverInfo=DriverInfo().obs;
  var latitude=23.5654.obs ;
  var longitude=23.5654.obs;
  RxBool  select =false.obs;


  String? token;
  String? userId;

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(MyPrefs.sUserId);
    prefs.remove(MyPrefs.userName);
    prefs.remove(MyPrefs.sToken);
    prefs.remove(MyPrefs.user);
    prefs.remove(MyPrefs.new_lat);
    prefs.remove(MyPrefs.new_long);
    Get.offAll(UserSelect());
  }





  @override
  void onInit() {
    Driver_info_Data();

    // TODO: implement onInit
    super.onInit();
  }


/// Get Driver information
  void Driver_info_Data() async {

    isLoading.value = true;
    update();
    token = await MyPrefs.getToken();


    String fullUrl = Urls.baseUrl + Urls.driver_info;
    Map<String, String> setHeaders = {
      'Accept': 'application/json',
      "Authorization": "bearer ${token}",

    };
    var response =
    await http.get(Uri.parse(fullUrl), headers: setHeaders);
    print(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      DriverInfo data = DriverInfo.fromJson(jsonDecode(response.body));
      if (data.error == false) {
        driverInfo.value=data;
        isLoading.value = false;
        update();
      }
    } else {

      isLoading.value = false;
      update();
    }
  }

/// Location Permission
  getCurrentLocation() async {
    PermissionStatus locationPermission=await Permission.location.request();

    if(locationPermission==PermissionStatus.granted){
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        print("latitude :${position.latitude}");
        print("longitude :${position.longitude}");
        latitude.value=position.latitude;
        longitude.value=position.longitude;
        update();
      }).catchError((e) {
        print(e);
      });
    }
    if(locationPermission==PermissionStatus.denied){
      openAppSettings();
    }
    if(locationPermission==PermissionStatus.permanentlyDenied){
      openAppSettings();
    }


  }


/// Send Driver Current Location
  void Send_Driver_Location(String bus_id,String route_id) async {

    isLoading.value = true;
    update();
    token = await MyPrefs.getToken();
    userId= await MyPrefs.getId();


    String fullUrl = Urls.baseUrl + Urls.driver_location_send;
    Map<String, String> data = {
      'lat': latitude.value.toString(),
      'long': longitude.value.toString(),
      'bus_id': bus_id,
      'route_id': route_id,
      'user_id': userId.toString(),
    };
    Map<String, String> setHeaders = {
      'Accept': 'application/json',
      "Authorization": "bearer ${token}",

    };

    PermissionStatus locationPermission=await Permission.location.request();
    if(locationPermission==PermissionStatus.granted){
      var response =
      await http.post(Uri.parse(fullUrl),body: data,headers: setHeaders);
      print(response.body.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body.toString());

        }
      } else {


      }


    }



  }







