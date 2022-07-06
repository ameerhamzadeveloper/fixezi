// To parse this JSON data, do
//
//     final fetchJobModel = fetchJobModelFromJson(jsonString);

import 'dart:convert';

FetchJobModel fetchJobModelFromJson(String str) => FetchJobModel.fromJson(json.decode(str));

String fetchJobModelToJson(FetchJobModel data) => json.encode(data.toJson());

class FetchJobModel {
  FetchJobModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<JobModel> data;

  factory FetchJobModel.fromJson(Map<String, dynamic> json) => FetchJobModel(
    status: json["status"],
    message: json["message"],
    data: List<JobModel>.from(json["data"].map((x) => JobModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class JobModel {
  JobModel({
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
    this.clientRating,
    this.statusText
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
  String? statusText;
  ClientRating? clientRating;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
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
    statusText: json["statusText"],
    clientRating: ClientRating.fromJson(json["clientRating"]),
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
    "clientRating": clientRating!.toJson(),
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
