// To parse this JSON data, do
//
//     final busLocationModel = busLocationModelFromJson(jsonString);

import 'dart:convert';

BusLocationModel busLocationModelFromJson(String str) => BusLocationModel.fromJson(json.decode(str));

String busLocationModelToJson(BusLocationModel data) => json.encode(data.toJson());

class BusLocationModel {
  bool? error;
  String? msg;
  Data? data;

  BusLocationModel({
    this.error,
    this.msg,
    this.data,
  });

  factory BusLocationModel.fromJson(Map<String, dynamic> json) => BusLocationModel(
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
  int? busId;
  double? lat;
  double? long;
  DateTime? updatedAt;

  Data({
    this.busId,
    this.lat,
    this.long,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    busId: json["bus_id"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "bus_id": busId,
    "lat": lat,
    "long": long,
    "updated_at": updatedAt?.toIso8601String(),
  };
}
