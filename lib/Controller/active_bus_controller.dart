

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../Model/active_bus_list_model.dart';
import '../Model/route_list_model.dart';
import '../Session/session.dart';
import '../Url/url.dart';

class ActiveBusController extends GetxController {

  var activeBusList = ActiveBusModel().obs;
  var isLoading = false.obs;
  String? token;

  @override
  void onInit() {
    //ActiveBus_data();
    // TODO: implement onInit
    super.onInit();
  }



  void ActiveBus_data(int? route_id) async {
    print("Route_id------------${route_id}");
    var id =route_id.toString();

    isLoading.value = true;
    update();
    token = await MyPrefs.getToken();


    String fullUrl = Urls.baseUrl + Urls.active_bus_api+id;
    Map<String, String> setHeaders = {
      'Accept': 'application/json',
      "Authorization": "bearer ${token}",

    };
    var response =
    await http.get(Uri.parse(fullUrl), headers: setHeaders);
    print(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      ActiveBusModel data = ActiveBusModel.fromJson(jsonDecode(response.body));
      if (data.error == false) {
        activeBusList.value=data;
        isLoading.value = false;
        update();
      }
    } else {
      isLoading.value = false;
      update();
    }
  }


}