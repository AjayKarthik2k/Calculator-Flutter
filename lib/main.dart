import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 25),
          elevation: 10,
          shadowColor: Colors.deepPurpleAccent[100]
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(Colors.deepPurpleAccent[100]),
          ),
        ),
        textTheme: TextTheme(
          button: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
