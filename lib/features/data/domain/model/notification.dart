import 'dart:convert';

NotificationDataModel dataModelFromJson(String str) =>
    NotificationDataModel.fromJson(json.decode(str));
String dataModelToJson(NotificationDataModel data) =>
    json.encode(data.toJson());

class NotificationDataModel {
  String? message;
  List<Data>? data;
  bool? success;

  NotificationDataModel({
    this.message,
    this.data,
    this.success,
  });

  NotificationDataModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.image,
    this.title,
    this.body,
    this.timestamp,
  });

  Data.fromJson(dynamic json) {
    image = json['image'];
    title = json['title'];
    body = json['body'];
    timestamp = json['timestamp'];
  }
  String? image;
  String? title;
  String? body;
  String? timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    map['title'] = title;
    map['body'] = body;
    map['timestamp'] = timestamp;
    return map;
  }
}
