
import 'package:flightapp/screens/myHomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flight App',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    
      
    );
  
    

    
  }
    final ThemeData appTheme = ThemeData(primaryColor: Color(0xFFF3791A),fontFamily: "Oxygen");

}

