// To parse this JSON data, do
//
//     final fetchEmployeModel = fetchEmployeModelFromJson(jsonString);

import 'dart:convert';

FetchEmployeModel fetchEmployeModelFromJson(String str) => FetchEmployeModel.fromJson(json.decode(str));

String fetchEmployeModelToJson(FetchEmployeModel data) => json.encode(data.toJson());

class FetchEmployeModel {
  FetchEmployeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<EmployeeModel> data;

  factory FetchEmployeModel.fromJson(Map<String, dynamic> json) => FetchEmployeModel(
    status: json["status"],
    message: json["message"],
    data: List<EmployeeModel>.from(json["data"].map((x) => EmployeeModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class EmployeeModel {
  EmployeeModel({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
    this.tradeManId,
    this.isActive,
    this.addDate,
  });

  String? userId;
  String? name;
  String? email;
  String? phoneNumber;
  String? tradeManId;
  String? isActive;
  String? addDate;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    userId: json["userId"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    tradeManId: json["tradeManId"],
    isActive: json["isActive"],
    addDate: json["addDate"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "name": name,
    "email": email,
    "phoneNumber": phoneNumber,
    "tradeManId": tradeManId,
    "isActive": isActive,
    "addDate": addDate,
  };
}
