// To parse this JSON data, do
//
//     final tradeModel = tradeModelFromJson(jsonString);

import 'dart:convert';

TradeModel tradeModelFromJson(String str) => TradeModel.fromJson(json.decode(str));

String tradeModelToJson(TradeModel data) => json.encode(data.toJson());

class TradeModel {
  TradeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<TradesModell> data;

  factory TradeModel.fromJson(Map<String, dynamic> json) => TradeModel(
    status: json["status"],
    message: json["message"],
    data: List<TradesModell>.from(json["data"].map((x) => TradesModell.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TradesModell {
  TradesModell({
    required this.tradeId,
    required this.tradeName,
    required this.addDate,
  });

  String tradeId;
  String tradeName;
  DateTime addDate;

  factory TradesModell.fromJson(Map<String, dynamic> json) => TradesModell(
    tradeId: json["tradeId"],
    tradeName: json["tradeName"],
    addDate: DateTime.parse(json["addDate"]),
  );

  Map<String, dynamic> toJson() => {
    "tradeId": tradeId,
    "tradeName": tradeName,
    "addDate": addDate.toIso8601String(),
  };
}
