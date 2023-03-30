import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:urbin_speak/library.dart';

class WordBloc {

  String randomWord = 'https://api.urbandictionary.com/v0/random';
  String urbanWord = 'https://api.urbandictionary.com/v0/define?term=';

  final _wordData = BehaviorSubject<UrbanWord2>();
  Stream<UrbanWord2> get dataWords => _wordData.stream;
  Function(UrbanWord2) get addData => _wordData.sink.add;

  dispose() {
    _wordData.close();
  }

  WordBloc();
  Future<UrbanWord2> fetchWord(String str) async {
    final response =
        await http.get(Uri.parse(str));

    if (response.statusCode == 200) {
      var info = json.decode(response.body);
      UrbanWord2 word1 = UrbanWord2.fromJson(json.decode(response.body));




      _wordData.sink.add(word1);
      return UrbanWord2.fromJson(info);
    } else {
      throw Exception('Failed to load word');
    }
  }
  Future<UrbanWord2> fetchWordDefinitions(String str) async {
    final response =
    await http.get(Uri.parse(str));

    if (response.statusCode == 200) {
      var info = json.decode(response.body);
      UrbanWord2 word1 = UrbanWord2.fromJson(json.decode(response.body));




      return UrbanWord2.fromJson(info);
    } else {
      throw Exception('Failed to load word');
    }
  }

}
