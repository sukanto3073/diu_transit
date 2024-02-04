// To parse this JSON data, do
//
//     final activeBusModel = activeBusModelFromJson(jsonString);

import 'dart:convert';

ActiveBusModel activeBusModelFromJson(String str) => ActiveBusModel.fromJson(json.decode(str));

String activeBusModelToJson(ActiveBusModel data) => json.encode(data.toJson());

class ActiveBusModel {
  bool? error;
  String? msg;
  List<Datum>? data;

  ActiveBusModel({
    this.error,
    this.msg,
    this.data,
  });

  factory ActiveBusModel.fromJson(Map<String, dynamic> json) => ActiveBusModel(
    error: json["error"],
    msg: json["msg"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? busId;
  String? routeId;
  String? driverId;
  String? busName;
  String? busNumber;
  String? routeName;
  String? routeCode;
  String? driverName;
  String? lastLat;
  String? lastLong;

  Datum({
    this.busId,
    this.routeId,
    this.driverId,
    this.busName,
    this.busNumber,
    this.routeName,
    this.routeCode,
    this.driverName,
    this.lastLat,
    this.lastLong,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    busId: json["bus_id"],
    routeId: json["route_id"],
    driverId: json["driver_id"],
    busName: json["bus_name"],
    busNumber: json["bus_number"],
    routeName: json["route_name"],
    routeCode: json["route_code"],
    driverName: json["driver_name"],
    lastLat: json["last_lat"],
    lastLong: json["last_long"],
  );

  Map<String, dynamic> toJson() => {
    "bus_id": busId,
    "route_id": routeId,
    "driver_id": driverId,
    "bus_name": busName,
    "bus_number": busNumber,
    "route_name": routeName,
    "route_code": routeCode,
    "driver_name": driverName,
    "last_lat": lastLat,
    "last_long": lastLong,
  };
}
