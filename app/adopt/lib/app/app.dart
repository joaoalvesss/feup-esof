import 'package:adopt/app/routing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _primaryColor = Color(0xFF79513A);

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/feed',
      onGenerateRoute: onGenerate,
      theme: ThemeData(
        primaryColor: _primaryColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.transparent,
        ),
      ),
    );
  }
}
