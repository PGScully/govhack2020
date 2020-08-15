import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twp/auth/user_repository.dart';
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
        ],
        child: MaterialApp(
          title: 'The Winning Project',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          initialRoute: splashRoute,
          onGenerateRoute: Router.generateRoute,
        ),
      );
}
