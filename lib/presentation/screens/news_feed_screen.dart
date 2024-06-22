import 'package:flutter/material.dart';

import '../../data/services/news_service.dart';

class NewsFeedScreen extends StatelessWidget {
  NewsFeedScreen({super.key});

  final NewsAPIService _newsAPIService = NewsAPIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Feed"),
        //Getting theme from
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: _newsAPIService.fetchAllNewsHeadlines(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          var listOfArticles = snapShot.data!;
          print(listOfArticles.toString());
          return ListView.builder(
            itemCount: listOfArticles.length,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            itemBuilder: (ctx, index) {
              var article = listOfArticles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(article.title ?? "Title Not available"),
                    subtitle: Text(article.description ?? ""),
                    trailing: Column(
                      children: [
                        Image.network(
                          article.imageUrl ?? '',
                          height: 50,
                          width: 50,
                          errorBuilder: (ctx, _, __) => Container(height: 100,width: 100,child: Placeholder()),
                        ),
                        Text(article.publishedAt?.toString() ?? ""),
                      ],
                    ),


                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
