import 'package:intl/intl.dart';

class Article {
  final String? title;
  final String? description;
  final String? imageUrl;
  final DateTime? publishedAt;
  final String? sourceName;
  final String? author;
  final String? content;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.sourceName,
    required this.author,
    required this.content,
  });

  // //Serialize
  // Map<String, dynamic> toMap(){
  //   return {
  //     "title": title,
  //   };
  // }

  //Deserialize

  static Article fromMap(Map<String,dynamic> articleJson){
    return Article(
      title: articleJson["title"],
      description: articleJson["description"],
      imageUrl: articleJson["urlToImage"],
      publishedAt: DateTime.parse(articleJson["publishedAt"]),
      sourceName: articleJson["source"]['name'],
      author: articleJson["author"],
      content: articleJson["content"],
    );
  }

  String? getFormattedPublishedDate(){
    if(publishedAt == null){
      return null;
    }
    DateFormat format = DateFormat.yMd();
    String formattedDate = format.format(publishedAt!);
    return formattedDate;
  }
}
