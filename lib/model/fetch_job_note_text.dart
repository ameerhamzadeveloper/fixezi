// To parse this JSON data, do
//
//     final fetchJobNoteText = fetchJobNoteTextFromJson(jsonString);

import 'dart:convert';

FetchJobNoteText fetchJobNoteTextFromJson(String str) => FetchJobNoteText.fromJson(json.decode(str));

String fetchJobNoteTextToJson(FetchJobNoteText data) => json.encode(data.toJson());

class FetchJobNoteText {
  FetchJobNoteText({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<JobNoteText> data;

  factory FetchJobNoteText.fromJson(Map<String, dynamic> json) => FetchJobNoteText(
    status: json["status"],
    message: json["message"],
    data: List<JobNoteText>.from(json["data"].map((x) => JobNoteText.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class JobNoteText {
  JobNoteText({
    this.jobNoteTextId,
    this.jobId,
    this.jobNoteText,
    this.userId,
    this.addDate,
  });

  String? jobNoteTextId;
  String? jobId;
  String? jobNoteText;
  String? userId;
  DateTime? addDate;

  factory JobNoteText.fromJson(Map<String, dynamic> json) => JobNoteText(
    jobNoteTextId: json["jobNoteTextId"],
    jobId: json["jobId"],
    jobNoteText: json["jobNoteText"],
    userId: json["userId"],
    addDate: DateTime.parse(json["addDate"]),
  );

  Map<String, dynamic> toJson() => {
    "jobNoteTextId": jobNoteTextId,
    "jobId": jobId,
    "jobNoteText": jobNoteText,
    "userId": userId,
    "addDate": addDate!.toIso8601String(),
  };
}
