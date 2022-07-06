// To parse this JSON data, do
//
//     final fetchTrademanModel = fetchTrademanModelFromJson(jsonString);

import 'dart:convert';

FetchTrademanModel fetchTrademanModelFromJson(String str) => FetchTrademanModel.fromJson(json.decode(str));

String fetchTrademanModelToJson(FetchTrademanModel data) => json.encode(data.toJson());

class FetchTrademanModel {
  FetchTrademanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Trademan> data;

  factory FetchTrademanModel.fromJson(Map<String, dynamic> json) => FetchTrademanModel(
    status: json["status"],
    message: json["message"],
    data: List<Trademan>.from(json["data"].map((x) => Trademan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Trademan {
  Trademan({
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
    this.password,
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
    this.tradeProblemId,
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
  String? password;
  String? companyWebsiteUrl;
  String? companyImageUrl;
  String? contractorlicenceImageUrl;
  dynamic? dontHaveContractorLicenceUrl;
  String? driverLicenceImageUrl;
  String? locationRadius;
  String? receiveEmail;
  String? calloutFee;
  String? emergencyCallout;
  String? workType;
  String? tradeId;
  String? tradeProblemId;
  String? workOnFixedPrice;
  String? hourlyRate;
  String? dontHaveContractorLicence;
  DateTime? addDate;
  dynamic? editDate;
  String? isActive;
  List<ServiceImage>? serviceImages;
  int? avgRating;
  String? totalRating;

  factory Trademan.fromJson(Map<String, dynamic> json) => Trademan(
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
    password: json["password"],
    companyWebsiteUrl: json["companyWebsiteUrl"],
    companyImageUrl: json["companyImageUrl"],
    contractorlicenceImageUrl: json["contractorlicenceImageUrl"] == null ? null : json["contractorlicenceImageUrl"],
    dontHaveContractorLicenceUrl: json["dontHaveContractorLicenceUrl"],
    driverLicenceImageUrl: json["driverLicenceImageUrl"] == null ? null : json["driverLicenceImageUrl"],
    locationRadius: json["locationRadius"],
    receiveEmail: json["receiveEmail"],
    calloutFee: json["calloutFee"],
    emergencyCallout: json["emergencyCallout"],
    workType: json["workType"],
    tradeId: json["tradeId"],
    tradeProblemId: json["tradeProblemId"],
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
    "password": password,
    "companyWebsiteUrl": companyWebsiteUrl,
    "companyImageUrl": companyImageUrl,
    "contractorlicenceImageUrl": contractorlicenceImageUrl == null ? null : contractorlicenceImageUrl,
    "dontHaveContractorLicenceUrl": dontHaveContractorLicenceUrl,
    "driverLicenceImageUrl": driverLicenceImageUrl == null ? null : driverLicenceImageUrl,
    "locationRadius": locationRadius,
    "receiveEmail": receiveEmail,
    "calloutFee": calloutFee,
    "emergencyCallout": emergencyCallout,
    "workType": workType,
    "tradeId": tradeId,
    "tradeProblemId": tradeProblemId,
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
    this.trademanDetailId,
    this.tradeManId,
    this.companyserviceImage,
  });

  String? trademanDetailId;
  String? tradeManId;
  String? companyserviceImage;

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
