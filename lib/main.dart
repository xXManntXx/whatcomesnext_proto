import 'package:flutter/material.dart';

import 'app_screens/home_screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WCNext',
      theme: ThemeData(
        primaryColor: Colors.indigo[500],
        scaffoldBackgroundColor: Colors.indigo[200],
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.indigoAccent),
      ),
      home: const MyHomePage(title: 'What Comes Next'),
    );
  }
}
