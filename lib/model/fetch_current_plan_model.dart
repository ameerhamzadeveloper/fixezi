// To parse this JSON data, do
//
//     final fetchCurrentPlanModel = fetchCurrentPlanModelFromJson(jsonString);

import 'dart:convert';

FetchCurrentPlanModel fetchCurrentPlanModelFromJson(String str) => FetchCurrentPlanModel.fromJson(json.decode(str));

String fetchCurrentPlanModelToJson(FetchCurrentPlanModel data) => json.encode(data.toJson());

class FetchCurrentPlanModel {
  FetchCurrentPlanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  CurrentPlanModel data;

  factory FetchCurrentPlanModel.fromJson(Map<String, dynamic> json) => FetchCurrentPlanModel(
    status: json["status"],
    message: json["message"],
    data: CurrentPlanModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class CurrentPlanModel {
  CurrentPlanModel({
    this.chosedPlanId,
    this.tradeManId,
    this.planId,
    this.startDate,
    this.endDate,
    this.isActive,
    this.addDate,
    this.planName,
    this.price,
    this.feature,
    required this.isPayed
  });

  String? chosedPlanId;
  String? tradeManId;
  String? planId;
  DateTime? startDate;
  DateTime? endDate;
  String? isActive;
  DateTime? addDate;
  String? planName;
  String? price;
  String? feature;
  String isPayed;

  factory CurrentPlanModel.fromJson(Map<String, dynamic> json) => CurrentPlanModel(
    chosedPlanId: json["chosedPlanId"],
    tradeManId: json["tradeManId"],
    planId: json["planId"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    isActive: json["isActive"],
    addDate: DateTime.parse(json["addDate"]),
    planName: json["planName"],
    price: json["price"],
    feature: json["feature"],
    isPayed: json['isPayed']
  );

  Map<String, dynamic> toJson() => {
    "chosedPlanId": chosedPlanId,
    "tradeManId": tradeManId,
    "planId": planId,
    "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "isActive": isActive,
    "addDate": addDate!.toIso8601String(),
    "planName": planName,
    "price": price,
    "feature": feature,
  };
}
