/// wordList : [{"definition":"Something tasteless, [monocultural], cheesy or [obtuse] that the person displaying the said item, behaviour or [demeanour] thinks is cool.","permalink":"http://fang.urbanup.com/1363834","thumbs_up":6,"author":"Kimba","word":"Fang","defid":1363834,"current_vote":"","written_on":"2005-07-12T07:19:01.000Z","example":"Guys wearing [trucker] hats, [pink shirts] with paint [splatters], and perma-tans, and who think driving around the block makes them cool","thumbs_down":40},{"definition":"A euphemistic expression regarding the extreme [urgency] to defecate and [holding it in] as much in as possible. Having the pressure of a fecal turd poking itself partially out of the [bum hole] while trying to make it to the closest restroom.","permalink":"http://turtle-peeking.urbanup.com/11296520","thumbs_up":11,"author":"Eaton Holgoode","word":"Turtle Peeking","defid":11296520,"current_vote":"","written_on":"2017-03-20T14:16:24.956Z","example":"Roger [sprinted] down the hall from his desk to the restroom. He has [a turtle] [peeking].","thumbs_down":0},{"definition":"Slab Slayers are an elite group of men who are the worlds best river, lake, and pond fishermen. They catch Bass, pike, [cat fish], wall eye, [perch] and many more. To join this group you have to catch a [big Slab] (fish) from and river, lake, or pond. Then you send it in to the Slab Slayer Group located on Facebook. If your Slab is worthy enough you will get a invatation to the Slab Slayers community. If you choose to accept, you will be a part of some of the worlds greatest fishermen.","permalink":"http://slab-slayers.urbanup.com/6688273","thumbs_up":13,"author":"BOFA","word":"Slab Slayers","defid":6688273,"current_vote":"","written_on":"2012-07-21T18:58:34.651Z","example":"Today i was fishing and [the Slab] Slayers showed up. They were [slayin] [the slab] everywhere i looked catching fish 6 to 15 inches long. One day i hope to be worthy enough to slay the slab. With the Slab Slayers.","thumbs_down":1},{"definition":"[Another word] for [point]","permalink":"http://fleek.urbanup.com/8165272","thumbs_up":8,"author":"PussyPoppinTedCruz","word":"Fleek","defid":8165272,"current_vote":"","written_on":"2015-03-17T19:55:49.856Z","example":"He [fleeked] towards [the right]","thumbs_down":76},{"definition":"The meaning of this [word is] he's more cute and handsome then others and is a [chill person] [to hang] out with","permalink":"http://jahir.urbanup.com/13731444","thumbs_up":12,"author":"Jahir garza","word":"Jahir","defid":13731444,"current_vote":"","written_on":"2019-03-21T03:33:22.122Z","example":"We had a [blast] with [jahir] [yesterday]","thumbs_down":4},{"definition":"The most beautiful female who doesn't take to people [treating] her [badly] can fight well and has an excellent [figure]","permalink":"http://kiyorah.urbanup.com/12806800","thumbs_up":2,"author":"Smart.com","word":"kiyorah","defid":12806800,"current_vote":"","written_on":"2018-04-06T19:23:52.103Z","example":"[Wow] [I want] to be kiyorah [one day]","thumbs_down":0},{"definition":"A person who is [sane], but appears to be mentally [handicapped] to those around them. May also appear to be [gay]/lesibian.","permalink":"http://amagee.urbanup.com/4502871","thumbs_up":5,"author":"rantt","word":"amagee","defid":4502871,"current_vote":"","written_on":"2010-01-14T21:41:02.000Z","example":"-oh [my god], does she like, have [downs] [or something]?\r\n-no, shes just an amagee","thumbs_down":6},{"definition":"A lovely [light skinned girl] , she's crazy , talented , and laughable . her favorite color is orange . shes [the only girl] with this name , NYC girl , aka [Cali] , Crazy Cali , or calitheterminator . has extreme taste in style , curly hair , Pisces , short , petite , and outgoing . a good role model . a gift from god .","permalink":"http://cali.urbanup.com/8154412","thumbs_up":5,"author":"Bae224","word":"cali","defid":8154412,"current_vote":"","written_on":"2015-03-12T03:13:15.858Z","example":"Calizsa is [amazing] and [talented].","thumbs_down":4}]

class UrbanWord {
  UrbanWord({
    List<WordList>? wordList,
  }) {
    _wordList = wordList;
  }

  UrbanWord.fromJson(dynamic json) {
    if (json['wordList'] != null) {
      _wordList = [];
      json['wordList'].forEach((v) {
        _wordList?.add(WordList.fromJson(v));
      });
    }
  }
  List<WordList>? _wordList;
  UrbanWord copyWith({
    List<WordList>? wordList,
  }) =>
      UrbanWord(
        wordList: wordList ?? _wordList,
      );
  List<WordList>? get wordList => _wordList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_wordList != null) {
      map['wordList'] = _wordList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// definition : "Something tasteless, [monocultural], cheesy or [obtuse] that the person displaying the said item, behaviour or [demeanour] thinks is cool."
/// permalink : "http://fang.urbanup.com/1363834"
/// thumbs_up : 6
/// author : "Kimba"
/// word : "Fang"
/// defid : 1363834
/// current_vote : ""
/// written_on : "2005-07-12T07:19:01.000Z"
/// example : "Guys wearing [trucker] hats, [pink shirts] with paint [splatters], and perma-tans, and who think driving around the block makes them cool"
/// thumbs_down : 40

class WordList {
  WordList({
    String? definition,
    String? permalink,
    num? thumbsUp,
    String? author,
    String? word,
    num? defid,
    String? currentVote,
    String? writtenOn,
    String? example,
    num? thumbsDown,
  }) {
    _definition = definition;
    _permalink = permalink;
    _thumbsUp = thumbsUp;
    _author = author;
    _word = word;
    _defid = defid;
    _currentVote = currentVote;
    _writtenOn = writtenOn;
    _example = example;
    _thumbsDown = thumbsDown;
  }

  WordList.fromJson(dynamic json) {
    _definition = json['definition'];
    _permalink = json['permalink'];
    _thumbsUp = json['thumbs_up'];
    _author = json['author'];
    _word = json['word'];
    _defid = json['defid'];
    _currentVote = json['current_vote'];
    _writtenOn = json['written_on'];
    _example = json['example'];
    _thumbsDown = json['thumbs_down'];
  }
  String? _definition;
  String? _permalink;
  num? _thumbsUp;
  String? _author;
  String? _word;
  num? _defid;
  String? _currentVote;
  String? _writtenOn;
  String? _example;
  num? _thumbsDown;
  WordList copyWith({
    String? definition,
    String? permalink,
    num? thumbsUp,
    String? author,
    String? word,
    num? defid,
    String? currentVote,
    String? writtenOn,
    String? example,
    num? thumbsDown,
  }) =>
      WordList(
        definition: definition ?? _definition,
        permalink: permalink ?? _permalink,
        thumbsUp: thumbsUp ?? _thumbsUp,
        author: author ?? _author,
        word: word ?? _word,
        defid: defid ?? _defid,
        currentVote: currentVote ?? _currentVote,
        writtenOn: writtenOn ?? _writtenOn,
        example: example ?? _example,
        thumbsDown: thumbsDown ?? _thumbsDown,
      );
  String? get definition => _definition;
  String? get permalink => _permalink;
  num? get thumbsUp => _thumbsUp;
  String? get author => _author;
  String? get word => _word;
  num? get defid => _defid;
  String? get currentVote => _currentVote;
  String? get writtenOn => _writtenOn;
  String? get example => _example;
  num? get thumbsDown => _thumbsDown;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['definition'] = _definition;
    map['permalink'] = _permalink;
    map['thumbs_up'] = _thumbsUp;
    map['author'] = _author;
    map['word'] = _word;
    map['defid'] = _defid;
    map['current_vote'] = _currentVote;
    map['written_on'] = _writtenOn;
    map['example'] = _example;
    map['thumbs_down'] = _thumbsDown;
    return map;
  }
}
