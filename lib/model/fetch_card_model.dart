// To parse this JSON data, do
//
//     final fetchCardModel = fetchCardModelFromJson(jsonString);

import 'dart:convert';

FetchCardModel fetchCardModelFromJson(String str) => FetchCardModel.fromJson(json.decode(str));

String fetchCardModelToJson(FetchCardModel data) => json.encode(data.toJson());

class FetchCardModel {
  FetchCardModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<FetchCard> data;

  factory FetchCardModel.fromJson(Map<String, dynamic> json) => FetchCardModel(
    status: json["status"],
    message: json["message"],
    data: List<FetchCard>.from(json["data"].map((x) => FetchCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class FetchCard {
  FetchCard({
    required this.paymentCardId,
    required this.userId,
    required this.userTypeId,
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvc,
    required this.expiryDate,
    required this.isActive,
    required this.addDate,
    required this.isSelected
  });

  String paymentCardId;
  String userId;
  String userTypeId;
  String cardHolderName;
  String cardNumber;
  String cvc;
  String expiryDate;
  String isActive;
  DateTime addDate;
  bool isSelected;

  factory FetchCard.fromJson(Map<String, dynamic> json) => FetchCard(
    paymentCardId: json["paymentCardId"],
    userId: json["userId"],
    userTypeId: json["userTypeId"],
    cardHolderName: json["cardHolderName"],
    cardNumber: json["cardNumber"],
    cvc: json["cvc"],
    expiryDate: json["expiryDate"],
    isActive: json["isActive"],
    addDate: DateTime.parse(json["addDate"]),
    isSelected: false
  );

  Map<String, dynamic> toJson() => {
    "paymentCardId": paymentCardId,
    "userId": userId,
    "userTypeId": userTypeId,
    "cardHolderName": cardHolderName,
    "cardNumber": cardNumber,
    "cvc": cvc,
    "expiryDate": expiryDate,
    "isActive": isActive,
    "addDate": addDate.toIso8601String(),
  };
}
