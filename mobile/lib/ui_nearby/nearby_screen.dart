import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'package:twp/auth/user_repository.dart';
import 'package:twp/repository/repository.dart';
import 'package:twp/ui_nearby/nearby_list.dart';
import 'package:twp/ui_nearby/nearby_map.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  Position _position;

  int _currentIndex = 0;
  List<Widget> _children = <Widget>[];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Nearby Challenges'),
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
                              applicationName: 'The Winning App',
                              applicationVersion: '0.1.0+1',
                              // applicationIcon:
                              //     Image.asset('assets/images/app.png'),
                              applicationLegalese:
                                  'Copyright The Winning Team.',
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
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ]),
          ],
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: Consumer<Repository>(
            builder: (context, repository, _) {
              final data = repository.challengesAt(_position);
              _children = [
                NearbyMap(challenges: data),
                NearbyList(locations: data),
              ];
              return _children[_currentIndex];
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
            ),
          ],
          onTap: (tab) {
            _onTabTapped(tab);
          },
        ),
      );

  @override
  void initState() {
    super.initState();

    _children = <Widget>[
      NearbyMap(),
      NearbyList(),
    ];
    _getLocation();
  }

  Future<void> _getLocation() async {
    _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
