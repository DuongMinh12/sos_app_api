import 'package:flutter/material.dart';
class ListBankModel {
  String? id;
  String? englishName;
  String? vietnameseName;
  String? description;
  String? location;
  String? shortName;
  String? icon;
  String? createdAt;
  String? updatedAt;

  ListBankModel(
      {this.id,
        this.englishName,
        this.vietnameseName,
        this.description,
        this.location,
        this.shortName,
        this.icon,
        this.createdAt,
        this.updatedAt});

  ListBankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    englishName = json['english_name'];
    vietnameseName = json['vietnamese_name'];
    description = json['description'];
    location = json['location'];
    shortName = json['short_name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['english_name'] = this.englishName;
    data['vietnamese_name'] = this.vietnameseName;
    data['description'] = this.description;
    data['location'] = this.location;
    data['short_name'] = this.shortName;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}