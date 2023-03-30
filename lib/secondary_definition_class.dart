import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'secondary_definition_class.g.dart';

@JsonSerializable()


class UrbanWordSecondaryOptions {
  String author;
  String date;
  int wordId;
  String example;
  String url;

  UrbanWordSecondaryOptions(
      {required this.author,
        required this.date,
        required this.wordId,
        required this.example,
        required this.url});

  factory UrbanWordSecondaryOptions.fromJson(Map<String, dynamic>json) => _$UrbanWordSecondaryOptionsFromJson(json);
  Map<String,dynamic> toJson()=> _$UrbanWordSecondaryOptionsToJson(this);
}