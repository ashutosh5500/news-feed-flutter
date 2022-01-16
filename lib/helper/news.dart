import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_feed/models/article_model.dart';

class News {
  List<Articles> news = [];
  String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d821f964557546ee8b448042342671a5';

  Future getNewsDataAPI() async {
    var response = await http.get(Uri.parse(url));
    print(response);
    news = ArticleModal.fromJson(jsonDecode(response.body)).articles!;
  }
}
