import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/aritcle_model.dart';

class NewsAPIService {
  String baseUrl = "https://newsapi.org/";

  Future<List<Article>> fetchAllNewsHeadlines() async {
    String apiKey = "b7c503c743584d49afe77f1f6134c479";
    String requestUrl = "$baseUrl/v2/everything?q=bitcoin&apiKey=$apiKey";

    try{
      var response = await http.get(Uri.parse(requestUrl));

      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        if (decodedJson["status"] == "ok") {
          print(decodedJson);
          var articlesJsonList = decodedJson["articles"] as List;
          var articleModels = articlesJsonList
              .map(
                (articleJson) => Article(
              title: articleJson["title"],
              description: articleJson["description"],
              imageUrl: articleJson["urlToImage"],
              publishedAt: DateTime.parse(articleJson["publishedAt"]),
              sourceName: articleJson["source"]['name'],
            ),
          )
              .toList();
          return articleModels;
        } else {
          throw Exception();
        }
        //TODO:Parse body json and return
      } else {
        throw Exception();
      }
    }
    catch(e,s){
      print(e.toString() + " " + s.toString());
      throw Exception();
    }


  }
}
