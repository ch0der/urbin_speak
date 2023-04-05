import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class FrontPageP extends StatefulWidget {
  const FrontPageP({Key? key}) : super(key: key);

  @override
  State<FrontPageP> createState() => _FrontPagePState();
}

class _FrontPagePState extends State<FrontPageP> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getWebInfo();
  }

  Future getWebInfo() async {
    final url = Uri.parse('https://www.amazon.com/gp/bestsellers');
    final res = await http.get(url);
    dom.Document html = dom.Document.html(res.body);

    final titles = html
        .querySelectorAll(' a:nth-child(1) > span > div')
        .map((e) => e.innerHtml.trim())
        .toList();
    print('Count: ${titles.length}');
    for (final title in titles) {
      debugPrint(title);
    }
    final urls = html
        .querySelectorAll(' a:nth-child(1)>span>div')
        .map((e) => 'https://www.amazon.com/${e.attributes['href']}')
        .toList();

    setState(() {
      articles = List.generate(
        titles.length,
        (index) => Article(
          title: titles[index],
          image: '',
          url: urls[index],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: amazonItems(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  amazonItems() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .75,
              child: ListTile(
                title: Text(
                  article.title,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(article.url)
              ),
            ),
          );
        },
        separatorBuilder: (context, intex) {
          return Container();
        },
        itemCount: articles.length);
  }
}

class FrontPageWidget extends StatefulWidget {
  const FrontPageWidget({Key? key}) : super(key: key);

  @override
  State<FrontPageWidget> createState() => _FrontPageWidgetState();
}

class _FrontPageWidgetState extends State<FrontPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container();
          },
          separatorBuilder: (BuildContext context, int index) => Container(),
          itemCount: 10),
    );
  }
}

class Article {
  Article({required this.title, required this.image, required this.url});
  String title;
  String image;
  String url;
}
