import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

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
      home: SplashScreen(),
    );
  }
}
