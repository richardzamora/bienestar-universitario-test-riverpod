// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

List<Person> listPersonFromJson(String str) =>
    List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String listPersonToJson(List<Person> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
  Person({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.userType = "Estudiante",
    this.password,
  });

  int? id;
  String? name;
  String? lastName;
  String? email;
  String? userType;
  String? password;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        userType: json["userType"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "userType": userType,
        "password": password,
      };
}
