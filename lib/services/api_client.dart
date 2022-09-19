import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/news.dart';
part 'api_client.g.dart';

const String newsUrl =
    'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey';
const String apiKey = 'eacefcc71ae04739bbe087cf17aab95b';

@RestApi(baseUrl: newsUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET('')
Future<News> fetchNews();
}
