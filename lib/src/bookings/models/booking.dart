// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

import 'package:app_bienestar_universitario/src/login/models/person.dart';
import 'package:app_bienestar_universitario/src/offered_services/models/offered_service.dart';

List<Booking> listBookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String listBookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  Booking({
    this.id,
    this.date,
    this.personId,
    this.offeredServiceId,
  });

  int? id;
  DateTime? date;
  Person? personId;
  OfferedService? offeredServiceId;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        personId:
            json["personId"] == null ? null : Person.fromJson(json["personId"]),
        offeredServiceId: json["offeredServiceId"] == null
            ? null
            : OfferedService.fromJson(json["offeredServiceId"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "personId": personId?.toJson(),
        "offeredServiceId": offeredServiceId?.toJson(),
      };
}
