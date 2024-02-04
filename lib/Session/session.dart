import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class MyPrefs {
  static const sUserId = "";
  static const userName = "name";
  static const userMobile = "01434354434";
  static const userEmail = "sukanto@gmail.com";
  static const sToken = "token";
  static const new_lat = "34.6666";
  static const new_long = "45.778787";
  static const user = "driver";
  SharedPreferences ? preferences;

  static Future<void> setToken(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sToken, authcode);
  }

  static Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(sToken) ?? "";
  }


  static Future<void> setlat(String set_lat ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(new_lat, set_lat);
  }

  static Future<String> getLat() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(new_lat) ?? "";
  }

  static Future<void> setlong(String set_long ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(new_long, set_long);
  }

  static Future<String> getlong() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(new_long) ?? "";
  }

  ///
  static Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, name);
  }

  static Future<String> getName() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName) ?? "";
  }

  static Future<void> setUserMobile(String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userMobile, mobile);
  }

  static Future<String> getMobile() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(userMobile) ?? "";
  }

  static Future<void> setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userEmail, email);
  }

  static Future<String> getEmail() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmail) ?? "";
  }













  ///

  static Future<void> setId(String authcode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sUserId, authcode);
  }

  static Future<String> getId() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(sUserId) ?? "";
  }

  static Future<void> setuser_type(String issetup ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(user, issetup);
  }

  static Future<String> get_user_type() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(user) ?? "";
  }
  /*static Future<bool?> set_language(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(EngToBan, isUserLoggedIn);
  }

  static Future<bool?> get_language() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(EngToBan);
  }*/


}
