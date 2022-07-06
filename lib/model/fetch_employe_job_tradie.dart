// To parse this JSON data, do
//
//     final fetchEmployeJobTradieModel = fetchEmployeJobTradieModelFromJson(jsonString);

import 'dart:convert';

FetchEmployeJobTradieModel fetchEmployeJobTradieModelFromJson(String str) => FetchEmployeJobTradieModel.fromJson(json.decode(str));

String fetchEmployeJobTradieModelToJson(FetchEmployeJobTradieModel data) => json.encode(data.toJson());

class FetchEmployeJobTradieModel {
  FetchEmployeJobTradieModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<EmployeJobTradieModel> data;

  factory FetchEmployeJobTradieModel.fromJson(Map<String, dynamic> json) => FetchEmployeJobTradieModel(
    status: json["status"],
    message: json["message"],
    data: List<EmployeJobTradieModel>.from(json["data"].map((x) => EmployeJobTradieModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class EmployeJobTradieModel {
  EmployeJobTradieModel({
    this.jobId,
    this.tradeManId,
    this.userId,
    this.problemId,
    this.isTimeFlexible,
    this.isDateFlexible,
    this.timeFlexibilty,
    this.dateFlexibilty,
    this.phoneNumber,
    this.otherPhoneNumber,
    this.relationtToPersonOnSite,
    this.personOnSite,
    this.address,
    this.latitude,
    this.longitude,
    this.jobStartTime,
    this.jobDateTime,
    this.isActive,
    this.addDate,
    this.tradeName,
    this.problemName,
    this.jobTime,
    this.status,
    this.statusText,
    this.clientRating,
    this.employData,
  });

  String? jobId;
  String? tradeManId;
  String? userId;
  String? problemId;
  String? isTimeFlexible;
  String? isDateFlexible;
  String? timeFlexibilty;
  String? dateFlexibilty;
  String? phoneNumber;
  String? otherPhoneNumber;
  String? relationtToPersonOnSite;
  String? personOnSite;
  String? address;
  String? latitude;
  String? longitude;
  String? jobStartTime;
  String? jobDateTime;
  String? isActive;
  DateTime? addDate;
  String? tradeName;
  String? problemName;
  String? jobTime;
  String? status;
  String? statusText;
  ClientRating? clientRating;
  List<EmployData>? employData;

  factory EmployeJobTradieModel.fromJson(Map<String, dynamic> json) => EmployeJobTradieModel(
    jobId: json["jobId"],
    tradeManId: json["tradeManId"],
    userId: json["userId"],
    problemId: json["problemId"],
    isTimeFlexible: json["isTimeFlexible"],
    isDateFlexible: json["isDateFlexible"],
    timeFlexibilty: json["timeFlexibilty"],
    dateFlexibilty: json["dateFlexibilty"],
    phoneNumber: json["phoneNumber"],
    otherPhoneNumber: json["otherPhoneNumber"],
    relationtToPersonOnSite: json["relationtToPersonOnSite"],
    personOnSite: json["personOnSite"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    jobStartTime: json["jobStartTime"],
    jobDateTime: json["jobDateTime"],
    isActive: json["isActive"],
    addDate: DateTime.parse(json["addDate"]),
    tradeName: json["tradeName"],
    problemName: json["problemName"],
    jobTime: json["jobTime"],
    status: json["status"],
    statusText: json["statusText"],
    clientRating: ClientRating.fromJson(json["clientRating"]),
    employData: List<EmployData>.from(json["employData"].map((x) => EmployData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "jobId": jobId,
    "tradeManId": tradeManId,
    "userId": userId,
    "problemId": problemId,
    "isTimeFlexible": isTimeFlexible,
    "isDateFlexible": isDateFlexible,
    "timeFlexibilty": timeFlexibilty,
    "dateFlexibilty": dateFlexibilty,
    "phoneNumber": phoneNumber,
    "otherPhoneNumber": otherPhoneNumber,
    "relationtToPersonOnSite": relationtToPersonOnSite,
    "personOnSite": personOnSite,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "jobStartTime": jobStartTime,
    "jobDateTime": jobDateTime,
    "isActive": isActive,
    "addDate": addDate!.toIso8601String(),
    "tradeName": tradeName,
    "problemName": problemName,
    "jobTime": jobTime,
    "status": status,
    "statusText": statusText,
    "clientRating": clientRating!.toJson(),
    "employData": List<dynamic>.from(employData!.map((x) => x.toJson())),
  };
}

class ClientRating {
  ClientRating({
    this.easilyContacted,
    this.easilyWorkFor,
    this.paymentOnCompletion,
    this.totalCompletedCancelJob,
    this.totalQuoteAcceptedRejected,
  });

  String? easilyContacted;
  String? easilyWorkFor;
  String? paymentOnCompletion;
  String? totalCompletedCancelJob;
  String? totalQuoteAcceptedRejected;

  factory ClientRating.fromJson(Map<String, dynamic> json) => ClientRating(
    easilyContacted: json["easilyContacted"],
    easilyWorkFor: json["easilyWorkFor"],
    paymentOnCompletion: json["paymentOnCompletion"],
    totalCompletedCancelJob: json["totalCompletedCancelJob"],
    totalQuoteAcceptedRejected: json["totalQuoteAcceptedRejected"],
  );

  Map<String, dynamic> toJson() => {
    "easilyContacted": easilyContacted,
    "easilyWorkFor": easilyWorkFor,
    "paymentOnCompletion": paymentOnCompletion,
    "totalCompletedCancelJob": totalCompletedCancelJob,
    "totalQuoteAcceptedRejected": totalQuoteAcceptedRejected,
  };
}

class EmployData {
  EmployData({
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

  factory EmployData.fromJson(Map<String, dynamic> json) => EmployData(
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
