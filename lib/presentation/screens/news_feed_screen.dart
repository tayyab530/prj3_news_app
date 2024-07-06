import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/services/news_service.dart';
import '../widgets/news_tile_widget.dart';

class NewsFeedScreen extends StatelessWidget {
  NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsAPIService newsAPIService = Provider.of<NewsAPIService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Feed"),
        //Getting theme from
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: newsAPIService.fetchAllNewsHeadlines(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          var listOfArticles = snapShot.data!;
          print(listOfArticles.toString());
          return ListView.builder(
            itemCount: listOfArticles.length,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            itemBuilder: (ctx, index) {
              var article = listOfArticles[index];
              return NewsTileWidget(article);
            },
          );
        },
      ),
    );
  }
}
