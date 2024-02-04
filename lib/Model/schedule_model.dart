// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  bool? error;
  String? msg;
  List<Datum>? data;

  ScheduleModel({
    this.error,
    this.msg,
    this.data,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
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
  int? id;
  String? routeName;
  String? routeCode;
  String? routeDetails;
  List<String>? startTimeSlot;
  List<String>? departureTimeSlot;
  String? routeMapUrl;

  Datum({
    this.id,
    this.routeName,
    this.routeCode,
    this.routeDetails,
    this.startTimeSlot,
    this.departureTimeSlot,
    this.routeMapUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    routeName: json["route_name"],
    routeCode: json["route_code"],
    routeDetails: json["route_details"],
    startTimeSlot: json["start_time_slot"] == null ? [] : List<String>.from(json["start_time_slot"]!.map((x) => x)),
    departureTimeSlot: json["departure_time_slot"] == null ? [] : List<String>.from(json["departure_time_slot"]!.map((x) => x)),
    routeMapUrl: json["route_map_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "route_name": routeName,
    "route_code": routeCode,
    "route_details": routeDetails,
    "start_time_slot": startTimeSlot == null ? [] : List<dynamic>.from(startTimeSlot!.map((x) => x)),
    "departure_time_slot": departureTimeSlot == null ? [] : List<dynamic>.from(departureTimeSlot!.map((x) => x)),
    "route_map_url": routeMapUrl,
  };
}
