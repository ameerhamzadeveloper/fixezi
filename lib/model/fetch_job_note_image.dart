// To parse this JSON data, do
//
//     final fetchJobNoteImage = fetchJobNoteImageFromJson(jsonString);

import 'dart:convert';

FetchJobNoteImage fetchJobNoteImageFromJson(String str) => FetchJobNoteImage.fromJson(json.decode(str));

String fetchJobNoteImageToJson(FetchJobNoteImage data) => json.encode(data.toJson());

class FetchJobNoteImage {
  FetchJobNoteImage({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<JobNoteImage> data;

  factory FetchJobNoteImage.fromJson(Map<String, dynamic> json) => FetchJobNoteImage(
    status: json["status"],
    message: json["message"],
    data: List<JobNoteImage>.from(json["data"].map((x) => JobNoteImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class JobNoteImage {
  JobNoteImage({
    this.jobNoteImageId,
    this.jobId,
    this.jobNoteImageUrl,
    this.userId,
    this.addDate,
  });

  String? jobNoteImageId;
  String? jobId;
  String? jobNoteImageUrl;
  String? userId;
  DateTime? addDate;

  factory JobNoteImage.fromJson(Map<String, dynamic> json) => JobNoteImage(
    jobNoteImageId: json["jobNoteImageId"],
    jobId: json["jobId"],
    jobNoteImageUrl: json["jobNoteImageUrl"],
    userId: json["userId"],
    addDate: DateTime.parse(json["addDate"]),
  );

  Map<String, dynamic> toJson() => {
    "jobNoteImageId": jobNoteImageId,
    "jobId": jobId,
    "jobNoteImageUrl": jobNoteImageUrl,
    "userId": userId,
    "addDate": addDate!.toIso8601String(),
  };
}
