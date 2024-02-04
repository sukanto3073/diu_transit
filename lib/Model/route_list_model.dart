// To parse this JSON data, do
//
//     final routeListModel = routeListModelFromJson(jsonString);

import 'dart:convert';

RouteListModel routeListModelFromJson(String str) => RouteListModel.fromJson(json.decode(str));

String routeListModelToJson(RouteListModel data) => json.encode(data.toJson());

class RouteListModel {
  bool? error;
  String? msg;
  List<Datum>? data;

  RouteListModel({
    this.error,
    this.msg,
    this.data,
  });

  factory RouteListModel.fromJson(Map<String, dynamic> json) => RouteListModel(
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
  int? routeId;
  String? routeName;
  String? routeCode;
  int? totalBus;
  int? activeBus;

  Datum({
    this.routeId,
    this.routeName,
    this.routeCode,
    this.totalBus,
    this.activeBus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    routeId: json["route_id"],
    routeName: json["route_name"],
    routeCode: json["route_code"],
    totalBus: json["total_bus"],
    activeBus: json["active_bus"],
  );

  Map<String, dynamic> toJson() => {
    "route_id": routeId,
    "route_name": routeName,
    "route_code": routeCode,
    "total_bus": totalBus,
    "active_bus": activeBus,
  };
}
