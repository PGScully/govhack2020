import 'package:flutter/material.dart';
import 'package:twp/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Winning Project',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: splashRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
