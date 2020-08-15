import 'package:flutter/material.dart';

import 'package:twp/router.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        textTheme: Theme.of(context).textTheme,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Center(
              child: Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Text(
              'Explore your local area, complete challenges, and win rewards!',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            // TODO: Determine if logged in, and show login/(other) button
            MaterialButton(
              color: Theme.of(context).buttonColor,
              onPressed: () {
                debugPrint('Login pressed!');
                // Navigator.of(context).pushReplacementNamed(loginRoute);
                Navigator.of(context).pushNamed(loginRoute);
              },
              child: const Text('Login'),
            )
          ],
        ),
      ));
}
