// To parse this JSON data, do
//
//     final jobRequestModel = jobRequestModelFromJson(jsonString);

import 'dart:convert';

JobRequestModel jobRequestModelFromJson(String str) => JobRequestModel.fromJson(json.decode(str));

String jobRequestModelToJson(JobRequestModel data) => json.encode(data.toJson());

class JobRequestModel {
  JobRequestModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<JobRequest> data;

  factory JobRequestModel.fromJson(Map<String, dynamic> json) => JobRequestModel(
    status: json["status"],
    message: json["message"],
    data: List<JobRequest>.from(json["data"].map((x) => JobRequest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class JobRequest {
  JobRequest({
    this.jobRequestId,
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
    this.isActive,
    this.addDate,
    this.tradeName,
    this.problemName,
    this.clientRating,
  });

  String? jobRequestId;
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
  String? isActive;
  DateTime? addDate;
  String? tradeName;
  String? problemName;
  ClientRating? clientRating;

  factory JobRequest.fromJson(Map<String, dynamic> json) => JobRequest(
    jobRequestId: json["jobRequestId"],
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
    isActive: json["isActive"],
    addDate: DateTime.parse(json["addDate"]),
    tradeName: json["tradeName"],
    problemName: json["problemName"],
    clientRating: ClientRating.fromJson(json["clientRating"]),
  );

  Map<String, dynamic> toJson() => {
    "jobRequestId": jobRequestId,
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
    "isActive": isActive,
    "addDate": addDate!.toIso8601String(),
    "tradeName": tradeName,
    "problemName": problemName,
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
