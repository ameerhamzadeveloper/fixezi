// To parse this JSON data, do
//
//     final fetchInvoiceModel = fetchInvoiceModelFromJson(jsonString);

import 'dart:convert';

FetchInvoiceModel fetchInvoiceModelFromJson(String str) => FetchInvoiceModel.fromJson(json.decode(str));

String fetchInvoiceModelToJson(FetchInvoiceModel data) => json.encode(data.toJson());

class FetchInvoiceModel {
  FetchInvoiceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<InvoiceModel> data;

  factory FetchInvoiceModel.fromJson(Map<String, dynamic> json) => FetchInvoiceModel(
    status: json["status"],
    message: json["message"],
    data: List<InvoiceModel>.from(json["data"].map((x) => InvoiceModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class InvoiceModel {
  InvoiceModel({
    this.jobInvoiceId,
    this.jobId,
    this.solution,
    this.tradePerson,
    this.paymentMethod,
    this.material,
    this.labour,
    this.price,
    this.incgst,
    this.additional,
    this.addDate,
    this.businessName,
    this.abn,
    this.companyImageUrl,
    this.businessAddress,
  });

  String? jobInvoiceId;
  String? jobId;
  String? solution;
  String? tradePerson;
  String? paymentMethod;
  String? material;
  String? labour;
  String? price;
  String? incgst;
  dynamic additional;
  DateTime? addDate;
  String? businessName;
  String? abn;
  String? companyImageUrl;
  String? businessAddress;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    jobInvoiceId: json["jobInvoiceId"],
    jobId: json["jobId"],
    solution: json["solution"],
    tradePerson: json["tradePerson"],
    paymentMethod: json["paymentMethod"],
    material: json["material"],
    labour: json["labour"],
    price: json["price"],
    incgst: json["incgst"],
    additional: json["additional"],
    addDate: DateTime.parse(json["addDate"]),
    businessName: json["businessName"],
    abn: json["abn"],
    companyImageUrl: json["companyImageUrl"],
    businessAddress: json["businessAddress"],
  );

  Map<String, dynamic> toJson() => {
    "jobInvoiceId": jobInvoiceId,
    "jobId": jobId,
    "solution": solution,
    "tradePerson": tradePerson,
    "paymentMethod": paymentMethod,
    "material": material,
    "labour": labour,
    "price": price,
    "incgst": incgst,
    "additional": additional,
    "addDate": addDate!.toIso8601String(),
    "businessName": businessName,
    "abn": abn,
    "companyImageUrl": companyImageUrl,
    "businessAddress": businessAddress,
  };
}
