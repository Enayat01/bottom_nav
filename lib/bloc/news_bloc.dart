import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/news_info.dart';

enum NewsEvent { fetch, delete }

class NewsBloc {
  final _stateController = StreamController<List<Article>>();
  final _eventController = StreamController<NewsEvent>();

  StreamSink<List<Article>> get _newsSink => _stateController.sink;
  Stream<List<Article>> get newsStream => _stateController.stream;

  StreamSink<NewsEvent> get eventSink => _eventController.sink;
  Stream<NewsEvent> get _eventStream => _eventController.stream;

  NewsBloc() {
    _eventStream.listen((event) async {
      if (event == NewsEvent.fetch) {
        try {
          var news = await getNews();
          _newsSink.add(news.articles);
        } on Exception catch (e) {
          _newsSink.addError('error occurred');
        }
      }
    });
  }
  Future<NewsModel> getNews() async {
    var newsModel;

    try {
      var response = await http.get(
        Uri.parse(
            'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=eacefcc71ae04739bbe087cf17aab95b'),
      );
      print(response.body);
      if (response.statusCode == 200) {
        newsModel = newsModelFromJson(response.body);
        return newsModel;
      }
    } on Exception {
      return newsModel;
    }

    return newsModel;
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
