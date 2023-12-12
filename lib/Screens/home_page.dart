
import 'dart:convert';

import 'package:diu_transit/Model/weather.dart';
import 'package:diu_transit/Network/weather_service.dart';
import 'package:diu_transit/Screens/transport_schedule.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import '../Presentation_Layer/color_manager.dart';
import '../Presentation_Layer/text_size_manager.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _weatherService = WeatherService("e6a638b7a72f191d2feacb4ae7fbd2bb");
  Weather? _weather;
  String?name;
  var mapApiKey='AIzaSyDZTlLGckV6h6hXKmSAq5_OfE3CoGpEPi4';

  //fetch weather
  _fetchWeather()async{
    // get the current city
    String cityName= await _weatherService.getCurrentCity();
    //get weather for city
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather=weather;
      });
    }catch(e){
      print(e);
    }
  }
  //init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch weather on startup
    _fetchWeather();
  }


  // weather animation
  String getWeatherAnimation(String?mainCondition){
    print('------------------------${_weather?.mainCondition?.toLowerCase()}');
    if(mainCondition==null)return 'assete/lottie_image/rain.json';

    switch(mainCondition.toLowerCase()){
      case'clouds':
      case'mist':
      case'smoke':
      case'haze':
      case'dust':
      case'fog':
        return 'assete/lottie_image/cloud.json';
      case'rain':
      case'drizzle':
      case'shower rain':
        return 'assete/lottie_image/rain.json';
      case'thunderstrom':
        return 'assete/lottie_image/thunder.json';
      case'clear':
        return 'assete/lottie_image/sunny.json';
      default:
        return 'assete/lottie_image/rain.json';
    }

  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var fontFamaliy="OpenSans";
    return SafeArea(child: Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //Weather card view design
             Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 77.0),
                child: Container(
                  height: screenSize.height/4.5,
                  width: screenSize.width/1.07,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: ColorManager.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_weather?.cityName ??"Loading...",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white
                        ),
                        textScaleFactor: TextSize.textScaleFactor(context),
                      ),
                      SizedBox(
                        height:screenSize.height/4,
                        width: screenSize.width/4,
                        child: Lottie.asset(getWeatherAnimation("${_weather?.mainCondition.toString()}")),
                      ),
                      Text("${_weather?.temperature?.round()}°C",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white
                        ),
                        textScaleFactor: TextSize.textScaleFactor(context),
                      ),
                    ],
                  )
                 ),
              ),
             ),
             
             const Gap(50),
             Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Text("Select your area",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                color: ColorManager.select_area
              ),
              textScaleFactor: TextSize.textScaleFactor(context),
            ),
          ),
             const Gap(18),
        
        //Select area list item
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                height: screenSize.height/6.5,
                width: screenSize.width/2.5,
                decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorManager.primary,
                ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                       fontFamily: fontFamaliy,color: ColorManager.white),
                     textScaleFactor: TextSize.textScaleFactor(context),
                   ),
                   Text("Total bus :7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                       fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),
                   Text("Active 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                       fontFamily: fontFamaliy,color: ColorManager.white),textScaleFactor: TextSize.textScaleFactor(context),),

                 ],
               ),
             ),
                  const Gap(20),
                  Container(
                    height: screenSize.height/6.5,
                    width: screenSize.width/2.5,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),
                        ),
                        Text("Total bus : 7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),
                        Text("Active: 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),

                      ],
                    ),
                  )
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: screenSize.height/6.5,
                    width: screenSize.width/2.5,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),
                        ),
                        Text("Total bus : 7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),
                        Text("Active: 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),

                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    height: screenSize.height/6.5,
                    width: screenSize.width/2.5,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorManager.primary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Dhanmondi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),
                        ),
                        Text("Total bus : 7",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),
                        Text("Active: 4",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                            fontFamily: fontFamaliy,color: ColorManager.white),),

                      ],
                    ),
                  )


                ],
              ),
            ],

          ),
        ),
           
           //  Custom Bottom Navigation Bar
           Center(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 63,
                  width: screenSize.width/1.07,
                  decoration: BoxDecoration(
                    color: ColorManager.gray,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ],

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assete/images/home.png"),
                          const Gap(2),
                           Text("home",textScaleFactor: TextSize.textScaleFactor(context),)
                        ],
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TransportSchedule()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assete/images/calendar.png"),
                            const Gap(2),
                             Text("schedule",textScaleFactor: TextSize.textScaleFactor(context),)
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assete/images/user.png"),
                          const Gap(2),
                           Text("profile",textScaleFactor: TextSize.textScaleFactor(context),)
                        ],
                      )
                    ],
                  ),
                ),
             ),
           ),

        ],
      ),
    ));
  }
}
