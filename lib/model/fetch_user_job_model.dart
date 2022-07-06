// To parse this JSON data, do
//
//     final fetchUserJobModel = fetchUserJobModelFromJson(jsonString);

import 'dart:convert';

FetchUserJobModel fetchUserJobModelFromJson(String str) => FetchUserJobModel.fromJson(json.decode(str));

String fetchUserJobModelToJson(FetchUserJobModel data) => json.encode(data.toJson());

class FetchUserJobModel {
  FetchUserJobModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<UserJobModel> data;

  factory FetchUserJobModel.fromJson(Map<String, dynamic> json) => FetchUserJobModel(
    status: json["status"],
    message: json["message"],
    data: List<UserJobModel>.from(json["data"].map((x) => UserJobModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UserJobModel {
  UserJobModel({
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
    this.tradeMan,
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
  TradeMan? tradeMan;

  factory UserJobModel.fromJson(Map<String, dynamic> json) => UserJobModel(
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
    tradeMan: TradeMan.fromJson(json["tradeMan"]),
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
    "tradeMan": tradeMan!.toJson(),
  };
}

class TradeMan {
  TradeMan({
    this.tradeManId,
    this.businessName,
    this.tradingName,
    this.abn,
    this.businessOwnerName,
    this.businessAddress,
    this.latitude,
    this.longitude,
    this.officePhone,
    this.mobileNumber,
    this.email,
    this.companyWebsiteUrl,
    this.companyImageUrl,
    this.contractorlicenceImageUrl,
    this.dontHaveContractorLicenceUrl,
    this.driverLicenceImageUrl,
    this.locationRadius,
    this.receiveEmail,
    this.calloutFee,
    this.emergencyCallout,
    this.workType,
    this.tradeId,
    this.tradeName,
    this.tradeProblemId,
    this.problemName,
    this.workOnFixedPrice,
    this.hourlyRate,
    this.dontHaveContractorLicence,
    this.addDate,
    this.editDate,
    this.isActive,
    this.serviceImages,
    this.avgRating,
    this.totalRating,
  });

  String? tradeManId;
  String? businessName;
  String? tradingName;
  String? abn;
  String? businessOwnerName;
  String? businessAddress;
  String? latitude;
  String? longitude;
  String? officePhone;
  String? mobileNumber;
  String? email;
  String? companyWebsiteUrl;
  String? companyImageUrl;
  String? contractorlicenceImageUrl;
  String? dontHaveContractorLicenceUrl;
  String? driverLicenceImageUrl;
  String? locationRadius;
  String? receiveEmail;
  String? calloutFee;
  String? emergencyCallout;
  String? workType;
  String? tradeId;
  String? tradeName;
  String? tradeProblemId;
  String? problemName;
  String? workOnFixedPrice;
  String? hourlyRate;
  String? dontHaveContractorLicence;
  DateTime? addDate;
  dynamic editDate;
  String? isActive;
  List<ServiceImage>? serviceImages;
  int? avgRating;
  String? totalRating;

  factory TradeMan.fromJson(Map<String, dynamic> json) => TradeMan(
    tradeManId: json["tradeManId"],
    businessName: json["businessName"],
    tradingName: json["tradingName"],
    abn: json["abn"],
    businessOwnerName: json["businessOwnerName"],
    businessAddress: json["businessAddress"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    officePhone: json["officePhone"],
    mobileNumber: json["mobileNumber"],
    email: json["email"],
    companyWebsiteUrl: json["companyWebsiteUrl"],
    companyImageUrl: json["companyImageUrl"],
    contractorlicenceImageUrl: json["contractorlicenceImageUrl"],
    dontHaveContractorLicenceUrl: json["dontHaveContractorLicenceUrl"],
    driverLicenceImageUrl: json["driverLicenceImageUrl"],
    locationRadius: json["locationRadius"],
    receiveEmail: json["receiveEmail"],
    calloutFee: json["calloutFee"],
    emergencyCallout: json["emergencyCallout"],
    workType: json["workType"],
    tradeId: json["tradeId"],
    tradeName: json["tradeName"],
    tradeProblemId: json["tradeProblemId"],
    problemName: json["problemName"],
    workOnFixedPrice: json["workOnFixedPrice"],
    hourlyRate: json["hourlyRate"],
    dontHaveContractorLicence: json["dontHaveContractorLicence"],
    addDate: DateTime.parse(json["addDate"]),
    editDate: json["editDate"],
    isActive: json["isActive"],
    serviceImages: List<ServiceImage>.from(json["serviceImages"].map((x) => ServiceImage.fromJson(x))),
    avgRating: json["avg_rating"],
    totalRating: json["totalRating"],
  );

  Map<String, dynamic> toJson() => {
    "tradeManId": tradeManId,
    "businessName": businessName,
    "tradingName": tradingName,
    "abn": abn,
    "businessOwnerName": businessOwnerName,
    "businessAddress": businessAddress,
    "latitude": latitude,
    "longitude": longitude,
    "officePhone": officePhone,
    "mobileNumber": mobileNumber,
    "email": email,
    "companyWebsiteUrl": companyWebsiteUrl,
    "companyImageUrl": companyImageUrl,
    "contractorlicenceImageUrl": contractorlicenceImageUrl,
    "dontHaveContractorLicenceUrl": dontHaveContractorLicenceUrl,
    "driverLicenceImageUrl": driverLicenceImageUrl,
    "locationRadius": locationRadius,
    "receiveEmail": receiveEmail,
    "calloutFee": calloutFee,
    "emergencyCallout": emergencyCallout,
    "workType": workType,
    "tradeId": tradeId,
    "tradeName": tradeName,
    "tradeProblemId": tradeProblemId,
    "problemName": problemName,
    "workOnFixedPrice": workOnFixedPrice,
    "hourlyRate": hourlyRate,
    "dontHaveContractorLicence": dontHaveContractorLicence,
    "addDate": addDate!.toIso8601String(),
    "editDate": editDate,
    "isActive": isActive,
    "serviceImages": List<dynamic>.from(serviceImages!.map((x) => x.toJson())),
    "avg_rating": avgRating,
    "totalRating": totalRating,
  };
}

class ServiceImage {
  ServiceImage({
    required this.trademanDetailId,
    required this.tradeManId,
    required this.companyserviceImage,
  });

  String trademanDetailId;
  String tradeManId;
  String companyserviceImage;

  factory ServiceImage.fromJson(Map<String, dynamic> json) => ServiceImage(
    trademanDetailId: json["trademanDetailId"],
    tradeManId: json["tradeManId"],
    companyserviceImage: json["companyserviceImage"],
  );

  Map<String, dynamic> toJson() => {
    "trademanDetailId": trademanDetailId,
    "tradeManId": tradeManId,
    "companyserviceImage": companyserviceImage,
  };
}
