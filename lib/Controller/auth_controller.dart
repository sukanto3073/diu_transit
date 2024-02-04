import 'dart:async';
import 'dart:convert';



import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diu_transit/Controller/home_controller.dart';
import 'package:diu_transit/Screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/auth_model.dart';
import '../Model/driver_info_model.dart';
import '../Screens/driver_bus_info.dart';
import '../Screens/user_select.dart';
import '../Session/session.dart';
import '../Url/url.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var Loading = false.obs;
  var connectionType = 0.obs;
  var userData = Authmodel().obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> regFormKey = GlobalKey<FormState>();

  //for login data
  TextEditingController usernameController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  //for Reg data
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController regpasswordController = TextEditingController();


  String? user = "";
  String? password = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  /*String? validationUser(String? value) {
    if (user == null || user!.isEmpty) {
      return "Enter Username";
    } else {
      return null;
    }
  }

  String? validationPassword(String? value) {
    if (password == null || password!.isEmpty) {
      return "Enter Password";
    } else if (password!.length < 5) {
      return "Password too short";
    } else {
      return null;
    }
  }*/

  void Login_Data() async {
    isLoading.value = true;
    update();

    Map<String, String> data = {
      'username': usernameController.text.toString(),
      'password': loginpasswordController.text.toString()
    };
    String fullUrl = Urls.baseUrl + Urls.login;
    Map<String, String> setHeaders = {'Accept': 'application/json'};
    var response =
    await http.post(Uri.parse(fullUrl), body: data, headers: setHeaders);
    print(response.body.toString());
    print(response.statusCode);
    if (response.statusCode == 200) {
      Authmodel users = Authmodel.fromJson(jsonDecode(response.body));
      userData.value=users;
      update();
      if (users.error == false) {
        MyPrefs.setToken(
            users.data!.jwtToken!.original!.accessToken.toString());
        MyPrefs.setId(users.data!.id.toString());
        MyPrefs.setName(users.data!.name.toString());
        MyPrefs.setuser_type(users.data!.usertype!.toString());
        MyPrefs.setEmail(users.data!.email!.toString());
        MyPrefs.setUserMobile(users.data!.mobile!.toString());
        print(users.data!.usertype!.toString());
            if (users.data!.usertype!.toString()=='Driver') {
                      Get.offAll(Driver_Info());
                    } else {
              Get.offAll(HomePage());
            }

                  Get.snackbar(
                    "${users.msg}",
                          "",
            icon: Icon(Icons.security_update_good, color: Colors.green),
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white
        );

        isLoading.value = false;
        update();
      }
    } else {

      Get.snackbar(
          "Login Fail",
          "Try again",
          icon: Icon(Icons.security_update_good, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        backgroundColor: Colors.white
      );
      isLoading.value = false;
      update();
    }
  }
  void Reg_Data() async {
    isLoading.value = true;
    update();


    Map<String, String> data = {
      'name': nameController.text.toString(),
      'email': emailController.text.toString(),
      'mobile': phoneNumberController.text.toString(),
      'password': regpasswordController.text.toString()
    };


    String fullUrl = Urls.baseUrl + Urls.registration;
    Map<String, String> setHeaders = {'Accept': 'application/json'};
    var response =
    await http.post(Uri.parse(fullUrl), body: data, headers: setHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      Authmodel users = Authmodel.fromJson(jsonDecode(response.body));

      MyPrefs.setToken(users.data!.jwtToken!.original!.accessToken.toString());
      MyPrefs.setId(users.data!.id.toString());
      MyPrefs.setuser_type(users.data!.usertype!.toString());


      Get.offAll(HomePage(),transition: Transition.leftToRightWithFade,duration: Duration(seconds: 2));
      Get.snackbar(
          "${users.msg}",
          "",
          icon: Icon(Icons.security_update_good, color: Colors.green),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3)
      );
      isLoading.value = false;
      update();

    }else{
      print(response.body);
      var jsonResponse = jsonDecode(response.body);
      Get.snackbar(
          "${jsonResponse['error']}",
          "Error.",
          icon: Icon(Icons.add, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3)
      );

      isLoading.value = false;
      update();
    }

  }




  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  void checkRealtimeConnection() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        connectionType.value = 0;
        print(event);
        update();
      } else if (event == ConnectivityResult.wifi) {
        connectionType.value = 1;
        print(event);
        update();
      } else {
        connectionType.value = 2;
        update();
      }
    });
  }

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
  void dispose() {
    // TODO: implement dispose
    _streamSubscription.cancel();
    super.dispose();
  }
}



