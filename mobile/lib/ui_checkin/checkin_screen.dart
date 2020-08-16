import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:twp/auth/user_repository.dart';
import 'package:twp/repository/location.dart';
import 'package:twp/repository/repository.dart';

class CheckinScreen extends StatefulWidget {
  int _id;

  CheckinScreen({int id}) {
    _id = id;
  }

  @override
  _CheckinScreenState createState() => _CheckinScreenState();
}

class _CheckinScreenState extends State<CheckinScreen> {
  @override
  Widget build(BuildContext context) {
    final Location location = Provider.of<Repository>(context)
        .locations
        .firstWhere((element) => element.id == widget._id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-in'),
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
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Text(
              location.title.rendered,
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Html(data: location.content.rendered),
            Text(location.acf.address),
            MaterialButton(
              padding: const EdgeInsets.all(4),
              color: Theme.of(context).buttonColor,
              onPressed: () {
                Provider.of<Repository>(context)
                    .checkin(locationId: location.id);
              },
              child: const Text('Check-in'),
            ),
          ],
        ),
      ),
    );
  }
}
