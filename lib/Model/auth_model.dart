// To parse this JSON data, do
//
//     final authmodel = authmodelFromJson(jsonString);

import 'dart:convert';

Authmodel authmodelFromJson(String str) => Authmodel.fromJson(json.decode(str));

String authmodelToJson(Authmodel data) => json.encode(data.toJson());

class Authmodel {
  bool? error;
  String? msg;
  Data? data;

  Authmodel({
    this.error,
    this.msg,
    this.data,
  });

  factory Authmodel.fromJson(Map<String, dynamic> json) => Authmodel(
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
  int? id;
  String? name;
  String? email;
  String? username;
  String? mobile;
  String? usertype;
  String? address;
  String? registeredBy;
  JwtToken? jwtToken;

  Data({
    this.id,
    this.name,
    this.email,
    this.username,
    this.mobile,
    this.usertype,
    this.address,
    this.registeredBy,
    this.jwtToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    username: json["username"],
    mobile: json["mobile"],
    usertype: json["usertype"],
    address: json["address"],
    registeredBy: json["registered_by"],
    jwtToken: json["jwt_token"] == null ? null : JwtToken.fromJson(json["jwt_token"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "username": username,
    "mobile": mobile,
    "usertype": usertype,
    "address": address,
    "registered_by": registeredBy,
    "jwt_token": jwtToken?.toJson(),
  };
}

class JwtToken {
  Headers? headers;
  Original? original;
  dynamic exception;

  JwtToken({
    this.headers,
    this.original,
    this.exception,
  });

  factory JwtToken.fromJson(Map<String, dynamic> json) => JwtToken(
    headers: json["headers"] == null ? null : Headers.fromJson(json["headers"]),
    original: json["original"] == null ? null : Original.fromJson(json["original"]),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "headers": headers?.toJson(),
    "original": original?.toJson(),
    "exception": exception,
  };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Original {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Original({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
