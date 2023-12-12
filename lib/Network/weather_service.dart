

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../Model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  static const Base_Url='http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName)async{

    final response =await http.get(Uri.parse('$Base_Url?q=$cityName&appid=$apiKey&units=metric'));
    if(response.statusCode==200){
      return Weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failded to load weather data');
    }
  }

  Future<String> getCurrentCity()async{
    LocationPermission permission =await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission= await Geolocator.requestPermission();
    }
    // fetch the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    // convert the location into a list of placemark objects
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude,position.longitude);

    // extract the city name from the first placemark
    String? ciry = placemark[0].locality;

    return ciry?? '';
  }



}