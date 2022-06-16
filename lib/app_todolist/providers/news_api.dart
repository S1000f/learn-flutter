import 'dart:convert';

import '../models/News.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static String apiUri = 'https://newsapi.org/v2/top-headlines?country=kr&apikey=';
  static String apiKey = 'f38e36528143c28e974df30aa69193';

  Uri uri =  Uri.parse(apiUri + apiKey);

  getNews() async {
    List<News> news = [];
    var response = await http.get(uri);
    var statusCode = response.statusCode;
    var body = response.body;

    if (statusCode == 200) {
      news = jsonDecode(body)['articles'].map<News>((article) => News.fromMap(article)).toList();
    }

    return news;
  }
}