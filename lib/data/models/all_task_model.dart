import 'dart:convert';

AllTaskModel allTaskModelFromMap(String string) => AllTaskModel.fromJson(json.decode(string));

String allTaskModelToMap(AllTaskModel data) => json.encode(data.toJson());

class AllTaskModel {
  bool? success;
  List<Data>? data;

  AllTaskModel({
    this.success,
    this.data,
  });

  AllTaskModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      AllTaskModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory AllTaskModel.fromJson(Map<String, dynamic> json) => AllTaskModel(
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  int? id;
  String? title;
  String? description;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? title,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
