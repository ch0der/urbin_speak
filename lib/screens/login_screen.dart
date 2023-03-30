import 'package:flutter/material.dart';
import 'package:urbin_speak/library.dart';
import 'package:urbin_speak/bloc/word_bloc.dart';
import 'package:urbin_speak/screens/alternative_definitions.dart';
import 'package:showcaseview/showcaseview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final bloc = WordBloc();
  late AnimationController _controller;
  late Animation<double> _animation;
  late int upVote;
  late int downVote;

  @override
  void initState() {
    super.initState();
    bloc.fetchWord("https://api.urbandictionary.com/v0/random");
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
    _controller.dispose();
  }

  void _onItemTap() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.black87,
        title: Text(
          "Random Urban Words",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ShowCaseWidget(

        builder: Builder(
          builder: (context) => body(),
        ),
      ),
    );
  }

  body() {
    return Container(
      child: Center(
        child: StreamBuilder<UrbanWord2>(
          stream: bloc.dataWords,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              UrbanWord2? words = snapshot.data;

              return refresh(
                ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      num? updoot = words?.list![index].thumbsUp!;
                      num? downdoot = words?.list![index].thumbsDown!;
                      num? percent =
                          ((updoot! - downdoot!) / (updoot + downdoot) * 100);
                      return ListTile(
                        onTap: () async {
                          final Future<UrbanWord2> future =
                              bloc.fetchWordDefinitions(
                                  "https://api.urbandictionary.com/v0/define?term=${words?.list![index].word}");
                          future.then(
                            (resp) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AlternativeDefinitions(newWord: resp),
                                settings: RouteSettings(),
                              ),
                            ),
                          );
                        },
                        title: Text(
                          words?.list![index].word ?? 'fail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                words?.list![index].definition
                                        ?.replaceAll("[", "")
                                        .replaceAll("]", "") ??
                                    'fail',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Container(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: definitionLikeRatio(
                                    " ",
                                    " ${percent.toInt()}%".replaceAll("-", ""),
                                    percent < 0
                                        ? Colors.red.shade200
                                        : Colors.green.shade200),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: words?.list!.length ?? 1,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 16.0,
                          color: Colors.grey[400],
                        )),
              );
            } else {
              return Container(
                height: 200,
                color: Colors.black54,
              );
            }
          },
        ),
      ),
    );
  }

  refresh(Widget child) {
    return RefreshIndicator(
      onRefresh: () async {
        await bloc.fetchWord("https://api.urbandictionary.com/v0/random");
      },
      child: child,
    );
  }

  definitionLikeRatio(String str, String str2, Color color) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.thumbs_up_down_rounded,
            color: Colors.grey.shade600,
          ),
          Text(str),
          Text(
            str2,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
