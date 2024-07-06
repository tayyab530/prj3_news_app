import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj3_news_app/data/services/news_service.dart';
import 'package:prj3_news_app/presentation/screens/news_feed_screen.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        Provider<NewsAPIService>(
          create: (ctx) => NewsAPIService(),
        ),
      ], child: NewsFeedScreen()),
    );
  }
}
