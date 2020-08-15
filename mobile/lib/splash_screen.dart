import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        textTheme: Theme.of(context).textTheme,
      ),
      body: Container());
}
