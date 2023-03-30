// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrbanWordPrimary _$UrbanWordPrimaryFromJson(Map<String, dynamic> json) =>
    UrbanWordPrimary(
      definition: json['definition'] as String,
      thumbsUp: json['thumbsUp'] as int,
      thumbsDown: json['thumbsDown'] as int,
      word: json['word'] as String,
    );

Map<String, dynamic> _$UrbanWordPrimaryToJson(UrbanWordPrimary instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'thumbsUp': instance.thumbsUp,
      'thumbsDown': instance.thumbsDown,
      'word': instance.word,
    };

// ignore: unused_element
UrbanWordSecondaryOptions _$UrbanWordSecondaryOptionsFromJson(
        Map<String, dynamic> json) =>
    UrbanWordSecondaryOptions(
      author: json['author'] as String,
      date: json['date'] as String,
      wordId: json['wordId'] as int,
      example: json['example'] as String,
      url: json['url'] as String,
    );

