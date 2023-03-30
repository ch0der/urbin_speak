// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondary_definition_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrbanWordSecondaryOptions _$UrbanWordSecondaryOptionsFromJson(
        Map<String, dynamic> json) =>
    UrbanWordSecondaryOptions(
      author: json['author'] as String,
      date: json['date'] as String,
      wordId: json['wordId'] as int,
      example: json['example'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$UrbanWordSecondaryOptionsToJson(
        UrbanWordSecondaryOptions instance) =>
    <String, dynamic>{
      'author': instance.author,
      'date': instance.date,
      'wordId': instance.wordId,
      'example': instance.example,
      'url': instance.url,
    };
