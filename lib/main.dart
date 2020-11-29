import 'package:flutter/material.dart';
import 'package:notchat/helper/authenticate.dart';



void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1F1F1F1F),
        accentColor: Color(0xff007EF4),
        primaryColor: Color(0xff145C9E),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,//?
      ),
         
      home: Authenticate(),
    );
  }
}
