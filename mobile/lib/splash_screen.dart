import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:twp/auth/status.dart';
import 'package:twp/auth/user_repository.dart';
import 'package:twp/router.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('B-HERE'),
          textTheme: Theme.of(context).textTheme,
          actions: <Widget>[
            PopupMenuButton<dynamic>(
                itemBuilder: (context) => [
                      PopupMenuItem<dynamic>(
                        child: ActionChip(
                          avatar: const Icon(Icons.info),
                          label: const Text('About'),
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              applicationName: 'B-HERE',
                              applicationVersion: '0.1.0+1',
                              // applicationIcon:
                              //     Image.asset('assets/images/app.png'),
                              applicationLegalese: 'Copyright The B-HERE Team.',
                            );
                          },
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<dynamic>(
                        child: Consumer<UserRepository>(
                          builder: (context, userRepository, _) => ActionChip(
                            avatar: const Icon(Icons.exit_to_app),
                            label: const Text('Logout'),
                            onPressed: () {
                              userRepository.logout();
                            },
                          ),
                        ),
                      ),
                    ]),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).backgroundColor,
          child: Consumer<UserRepository>(
            builder: (context, userRepository, _) => Column(
              children: [
                Center(
                  child: Text(
                    'B-HERE',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Text(
                  'Explore your local area, complete challenges, and win rewards!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                if (userRepository.status != Status.authenticated)
                  MaterialButton(
                    padding: const EdgeInsets.all(4),
                    color: Theme.of(context).buttonColor,
                    onPressed: () {
                      debugPrint('Login pressed!');
                      // Navigator.of(context).pushReplacementNamed(loginRoute);
                      Navigator.of(context).pushNamed(loginRoute);
                    },
                    child: const Text('Login'),
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(4),
                            color: Theme.of(context).buttonColor,
                            onPressed: () {
                              debugPrint('Nearby pressed!');
                              // Navigator.of(context).pushReplacementNamed(loginRoute);
                              Navigator.of(context).pushNamed(nearbyRoute);
                            },
                            child: const Text('Nearby'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(4),
                            color: Theme.of(context).buttonColor,
                            onPressed: () {
                              debugPrint('Progress pressed!');
                              // Navigator.of(context).pushReplacementNamed(loginRoute);
                              Navigator.of(context).pushNamed(progressRoute);
                            },
                            child: const Text(
                              'In Progress',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            padding: const EdgeInsets.all(4),
                            color: Theme.of(context).buttonColor,
                            onPressed: () {
                              debugPrint('Redeem pressed!');
                              // Navigator.of(context).pushReplacementNamed(loginRoute);
                              Navigator.of(context).pushNamed(redeemRoute);
                            },
                            child: const Text('Redeem'),
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
      );
}
