// To parse this JSON data, do
//
//     final offeredService = offeredServiceFromJson(jsonString);

import 'dart:convert';

import 'package:app_bienestar_universitario/src/home/models/campus.dart';

List<OfferedService> listOfferedServiceFromJson(String str) =>
    List<OfferedService>.from(
        json.decode(str).map((x) => OfferedService.fromJson(x)));

String listOfferedServiceToJson(List<OfferedService> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

OfferedService offeredServiceFromJson(String str) =>
    OfferedService.fromJson(json.decode(str));

String offeredServiceToJson(OfferedService data) => json.encode(data.toJson());

class OfferedService {
  OfferedService({
    this.id,
    this.campusId,
    this.name,
    this.description,
    this.capacity,
  });

  int? id;
  Campus? campusId;
  String? name;
  String? description;
  int? capacity;

  factory OfferedService.fromJson(Map<String, dynamic> json) => OfferedService(
        id: json["id"],
        campusId:
            json["campusId"] == null ? null : Campus.fromJson(json["campusId"]),
        name: json["name"],
        description: json["description"],
        capacity: json["capacity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "campusId": campusId?.toJson(),
        "name": name,
        "description": description,
        "capacity": capacity,
      };
}
