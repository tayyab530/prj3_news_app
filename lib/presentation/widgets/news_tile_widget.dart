import 'package:flutter/material.dart';
import 'package:prj3_news_app/data/models/aritcle_model.dart';
import 'package:prj3_news_app/presentation/screens/new_details_screen.dart';

class NewsTileWidget extends StatelessWidget {
  const NewsTileWidget(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
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
              Text(article.getFormattedPublishedDate() ?? ""),
            ],
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) {
                return NewsDetailsScreen(article);
              }),
            );
          },
        ),
      ),
    );
  }
}
