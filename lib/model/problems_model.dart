// To parse this JSON data, do
//
//     final problemModel = problemModelFromJson(jsonString);

import 'dart:convert';

ProblemModel problemModelFromJson(String str) => ProblemModel.fromJson(json.decode(str));

String problemModelToJson(ProblemModel data) => json.encode(data.toJson());

class ProblemModel {
  ProblemModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Problems> data;

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
    status: json["status"],
    message: json["message"],
    data: List<Problems>.from(json["data"].map((x) => Problems.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Problems {
  Problems({
    required this.problemId,
    required this.tradeId,
    required this.problemName,
    required this.addDate,
  });

  String problemId;
  String tradeId;
  String problemName;
  DateTime addDate;

  factory Problems.fromJson(Map<String, dynamic> json) => Problems(
    problemId: json["problemId"],
    tradeId: json["tradeId"],
    problemName: json["problemName"],
    addDate: DateTime.parse(json["addDate"]),
  );

  Map<String, dynamic> toJson() => {
    "problemId": problemId,
    "tradeId": tradeId,
    "problemName": problemName,
    "addDate": addDate.toIso8601String(),
  };
}
