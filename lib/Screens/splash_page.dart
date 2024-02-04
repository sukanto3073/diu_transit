import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diu_transit/Screens/user_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Session/session.dart';
import 'driver_bus_info.dart';
import 'home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  String ? token;
  String ? user_type;
  getToken() async {
    await MyPrefs.getToken().then((value) {
      token = value;
    });
  }

  getUserType() async {
    await MyPrefs.get_user_type().then((value) {
      user_type = value;
    });
    print(user_type);
  }

  startTime() async {
    print("Token______________${token}");
    print("Token______________${user_type}");
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {

    if(token==null || token == ""){
      /*Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
          builder: (context) => LoginScreen()
      ));*/
      Get.offAll(UserSelect(),transition: Transition.zoom,duration: Duration(seconds: 1));

    }else{
      if(user_type=="Driver"){
        /*Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
            builder: (context) =>  EstimateForm()
        ));*/
        Get.offAll(Driver_Info(),transition: Transition.zoom,duration: Duration(seconds: 1));

      }else{
        /*Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
            builder: (context) => const MainPage()
        ));*/
        Get.offAll(HomePage(),transition: Transition.zoom,duration: Duration(seconds: 1));
      }
    }
  }
  Future<bool> checkinternet()async{
    var connectivityResult= await (Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile || connectivityResult==ConnectivityResult.wifi){
      return true;
    }else{
      return false;
    }
  }

  void initTimer()async{
    if(await checkinternet()){
      startTime();
    }else{
      //Get.offAll(InternetError());
    }
  }

  @override
  void initState() {

    getToken();
    getUserType();
    initTimer();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,  //const Color(0xfff5591f),
        body:Container(
          child: FutureBuilder(
              future: checkinternet(),
              builder: (BuildContext c,snap){
                return  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Center(
                      child: SizedBox(
                        width: 400,
                        height: 400,
                        child: Image.asset("assete/images/daffodil.png"),
                      ),
                    ),
                    const SizedBox(height: 20,),

                  ],
                );
              }
          ),
        ));
  }

}






