

import 'package:json_annotation/json_annotation.dart';
part 'definition_class.g.dart';

@JsonSerializable()


class UrbanWordPrimary {
  String definition;
  int thumbsUp;
  int thumbsDown;
  String word;

  UrbanWordPrimary(
      {required this.definition,
      required this.thumbsUp,
      required this.thumbsDown,
      required this.word});

  factory UrbanWordPrimary.fromJson(Map<String, dynamic>json) => _$UrbanWordPrimaryFromJson(json);
  Map<String,dynamic> toJson()=> _$UrbanWordPrimaryToJson(this);
}

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
}
