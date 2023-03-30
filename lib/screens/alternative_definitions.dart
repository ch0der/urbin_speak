import 'package:flutter/material.dart';
import 'package:urbin_speak/bloc/word_bloc.dart';
import 'package:urbin_speak/jsons/urban_word2.dart';
import 'dart:math';

import 'package:urbin_speak/widgets/likeRatio.dart';

class AlternativeDefinitions extends StatefulWidget {
  AlternativeDefinitions({Key? key, required this.newWord}) : super(key: key);

  final UrbanWord2 newWord;

  @override
  State<AlternativeDefinitions> createState() => _AlternativeDefinitionsState();
}

class _AlternativeDefinitionsState extends State<AlternativeDefinitions> {
  final bloc = WordBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87,title: Text("Definitions For ${widget.newWord.list![0].word}",style: TextStyle(color: Colors.white),),),
      body: body(),
    );
  }

  body() {
    List<NewList> wordList = widget.newWord.list!;
    return Container(
        child: ListView.separated(
      itemBuilder: (BuildContext context, int index) => ListTile(
        subtitle: Column(
          children: [
            Text(
              widget.newWord.list![index].definition!
                  .replaceAll("[", "")
                  .replaceAll("]", ""),
              style: TextStyle(
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.start,
            ),
            WordLikeRatio(
                num1: wordList[index].thumbsUp!,
                num2: wordList[index].thumbsDown!),
          ],
        ),
        title: Text(
          widget.newWord.list![index].word!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade200
                .withOpacity(1),
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => Container(
        height: 15,
        color: Colors.white54,
      ),
      itemCount: widget.newWord.list!.length,
    ));
  }
}
