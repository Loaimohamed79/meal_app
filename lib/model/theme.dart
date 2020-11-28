import 'package:flutter/material.dart';
final themedata=ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
          ),
           headline2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline3: TextStyle(fontSize: 20,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold
          )
        )
      );