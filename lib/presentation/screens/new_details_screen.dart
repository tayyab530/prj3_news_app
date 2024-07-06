import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../data/models/aritcle_model.dart';
import '../../data/services/news_service.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen(this.article,{super.key});
  
  final Article article;

  @override
  Widget build(BuildContext context) {
    // NewsAPIService newsAPIService = Provider.of<NewsAPIService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title ?? "No title"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Image.network(
            article.imageUrl ?? '',
            errorBuilder: (ctx, _, __) => Container(child: const Placeholder()),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Author: ${article.author ?? "-"}",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500),),
                    Text("Published at: ${article.getFormattedPublishedDate() ?? "-"}",style: GoogleFonts.poppins(),),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(article.description ?? "No description",style: GoogleFonts.poppins(),),
                const SizedBox(height: 20,),
                Text(article.content ?? "No content",style: GoogleFonts.poppins(),),
              ],
            ),
          ),

        ],
      )
    );
  }
}
