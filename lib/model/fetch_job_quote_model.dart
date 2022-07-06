// To parse this JSON data, do
//
//     final fetchJobQuoteModel = fetchJobQuoteModelFromJson(jsonString);

import 'dart:convert';

FetchJobQuoteModel fetchJobQuoteModelFromJson(String str) => FetchJobQuoteModel.fromJson(json.decode(str));

String fetchJobQuoteModelToJson(FetchJobQuoteModel data) => json.encode(data.toJson());

class FetchJobQuoteModel {
  FetchJobQuoteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<JobQuoteModel> data;

  factory FetchJobQuoteModel.fromJson(Map<String, dynamic> json) => FetchJobQuoteModel(
    status: json["status"],
    message: json["message"],
    data: List<JobQuoteModel>.from(json["data"].map((x) => JobQuoteModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class JobQuoteModel {
  JobQuoteModel({
    this.jobQuoteId,
    this.jobQuoteDescription,
    this.price,
    this.incgst,
    this.jobId,
    this.images,
    this.dateTime,
    this.days
  });

  String? jobQuoteId;
  String? jobQuoteDescription;
  String? price;
  String? incgst;
  String? jobId;
  String? days;
  DateTime? dateTime;
  List<Image>? images;

  factory JobQuoteModel.fromJson(Map<String, dynamic> json) => JobQuoteModel(
    jobQuoteId: json["jobQuoteId"],
    jobQuoteDescription: json["jobQuoteDescription"],
    price: json["price"],
    incgst: json["incgst"],
    jobId: json["jobId"],
    days: json["days"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    dateTime: DateTime.parse(json["dateTime"])
  );

  Map<String, dynamic> toJson() => {
    "jobQuoteId": jobQuoteId,
    "jobQuoteDescription": jobQuoteDescription,
    "price": price,
    "incgst": incgst,
    "jobId": jobId,
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    this.jobQuoteImageId,
    this.jobQuoteId,
    this.imageUrl,
  });

  String? jobQuoteImageId;
  String? jobQuoteId;
  String? imageUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    jobQuoteImageId: json["jobQuoteImageId"],
    jobQuoteId: json["jobQuoteId"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "jobQuoteImageId": jobQuoteImageId,
    "jobQuoteId": jobQuoteId,
    "imageUrl": imageUrl,
  };
}
