// To parse this JSON data, do
//
//     final campus = campusFromJson(jsonString);

import 'dart:convert';

List<Campus> listCampusFromJson(String str) =>
    List<Campus>.from(json.decode(str).map((x) => Campus.fromJson(x)));

String listCampusToJson(List<Campus> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Campus campusFromJson(String str) => Campus.fromJson(json.decode(str));

String campusToJson(Campus data) => json.encode(data.toJson());

class Campus {
  Campus({
    this.id,
    this.name,
    this.address,
  });

  int? id;
  String? name;
  String? address;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        id: json["id"],
        name: json["name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
      };
}
