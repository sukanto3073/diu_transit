

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../Model/route_list_model.dart';
import '../Session/session.dart';
import '../Url/url.dart';

class HomeController extends GetxController {

var routeList = RouteListModel().obs;
var isLoading = false.obs;
String? token;

@override
void onInit() {
  Route_List_data();
  // TODO: implement onInit
  super.onInit();
}



void Route_List_data() async {

  isLoading.value = true;
  update();
  token = await MyPrefs.getToken();


  String fullUrl = Urls.baseUrl + Urls.route_list_api;
  Map<String, String> setHeaders = {
    'Accept': 'application/json',
    "Authorization": "bearer ${token}",

  };
  var response =
  await http.get(Uri.parse(fullUrl), headers: setHeaders);
  print(response.body.toString());
  print(response.statusCode);
  if (response.statusCode == 200) {
    RouteListModel data = RouteListModel.fromJson(jsonDecode(response.body));
    if (data.error == false) {
      routeList.value=data;
      isLoading.value = false;
      update();
    }
  } else {

    isLoading.value = false;
    update();
  }
}


}