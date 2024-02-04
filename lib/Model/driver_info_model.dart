// To parse this JSON data, do
//
//     final driverInfo = driverInfoFromJson(jsonString);

import 'dart:convert';

DriverInfo driverInfoFromJson(String str) => DriverInfo.fromJson(json.decode(str));

String driverInfoToJson(DriverInfo data) => json.encode(data.toJson());

class DriverInfo {
  bool? error;
  String? msg;
  Data? data;

  DriverInfo({
    this.error,
    this.msg,
    this.data,
  });

  factory DriverInfo.fromJson(Map<String, dynamic> json) => DriverInfo(
    error: json["error"],
    msg: json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": data?.toJson(),
  };
}

class Data {
  int? driverId;
  String? busId;
  String? routeId;
  String? busName;
  String? busNumber;
  String? routeName;
  String? routeCode;
  String? routeDetails;
  List<String>? startTimeSlot;
  List<String>? departureTimeSlot;
  String? routeMapUrl;

  Data({
    this.driverId,
    this.busId,
    this.routeId,
    this.busName,
    this.busNumber,
    this.routeName,
    this.routeCode,
    this.routeDetails,
    this.startTimeSlot,
    this.departureTimeSlot,
    this.routeMapUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    driverId: json["driver_id"],
    busId: json["bus_id"],
    routeId: json["route_id"],
    busName: json["bus_name"],
    busNumber: json["bus_number"],
    routeName: json["route_name"],
    routeCode: json["route_code"],
    routeDetails: json["route_details"],
    startTimeSlot: json["start_time_slot"] == null ? [] : List<String>.from(json["start_time_slot"]!.map((x) => x)),
    departureTimeSlot: json["departure_time_slot"] == null ? [] : List<String>.from(json["departure_time_slot"]!.map((x) => x)),
    routeMapUrl: json["route_map_url"],
  );

  Map<String, dynamic> toJson() => {
    "driver_id": driverId,
    "bus_id": busId,
    "route_id": routeId,
    "bus_name": busName,
    "bus_number": busNumber,
    "route_name": routeName,
    "route_code": routeCode,
    "route_details": routeDetails,
    "start_time_slot": startTimeSlot == null ? [] : List<dynamic>.from(startTimeSlot!.map((x) => x)),
    "departure_time_slot": departureTimeSlot == null ? [] : List<dynamic>.from(departureTimeSlot!.map((x) => x)),
    "route_map_url": routeMapUrl,
  };
}
