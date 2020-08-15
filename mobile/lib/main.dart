import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twp/auth/user_repository.dart';
import 'package:twp/repository/repository.dart';
import 'package:twp/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<UserRepository>(
            create: (_) => UserRepository(),
          ),
          ChangeNotifierProxyProvider<UserRepository, Repository>(
            create: (_) => Repository(userRepository: null),
            update: (_, userRepository, repository) =>
                Repository(userRepository: userRepository),
          )
        ],
        child: MaterialApp(
          title: 'The Winning Project',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          initialRoute: splashRoute,
          onGenerateRoute: Router.generateRoute,
        ),
      );
}
