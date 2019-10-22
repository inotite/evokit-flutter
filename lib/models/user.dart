
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

var apiKey = "3VvD5PCewrYgakal35Xi";
var apiUrl = "http://myaccount-dev.evovor.com/api/";

dynamic fetchUser(email, password) async {
  var map = Map<String, dynamic>();
  map["email"] = email;
  map["password"] = password;
  map["service_id"] = "1";
  map["api_key"] = apiKey;
  
  final response = await http.post(
    apiUrl + "auth",
    body: map
  );

  final responseJson = json.decode(response.body);
  print(responseJson);

  return responseJson;
}

dynamic registerUser(name, email, password, passwordConfirmation) async {
  var map = Map<String, dynamic>();
  map["name"] = name;
  map["email"] = email;
  map["password"] = password;
  map["password_confirmation"] = passwordConfirmation;
  map["api_key"] = apiKey;

  final response = await http.post(
    apiUrl + "register",
    body: map
  );

  final responseJson = json.decode(response.body);
  print(responseJson);

  return responseJson;
}

dynamic resetPassword(email) async {
  var map = Map<String, dynamic>();
  map["email"] = email;
  map["api_key"] = apiKey;

  final response = await http.post(
    apiUrl + "resetPassword",
    body: map
  );

  final responseJson = json.decode(response.body);
  print(responseJson);

  return responseJson;
}

class User {
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String phone;
  final bool gender;
  final String address;
  final int status;
  final int licenseId;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.phone, this.gender, this.address, this.status, this.licenseId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      phone: json['phone'],
      gender: json['gender'],
      address: json['address'],
      status: json['status'],
      licenseId: json['license_id'],
    );
  }
}