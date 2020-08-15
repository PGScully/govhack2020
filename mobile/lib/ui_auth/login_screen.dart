import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twp/auth/status.dart';

import 'package:twp/auth/user_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
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
                        applicationLegalese: 'Copyright The Winning Team.',
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).backgroundColor,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _usernameField(),
                  _passwordField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _cancelButton(context),
                      _loginButton(context),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Expanded _cancelButton(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Theme.of(context).buttonColor,
            onPressed: () {
              debugPrint('Cancel pressed');
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ),
      );

  TextFormField _usernameField() => TextFormField(
        initialValue: "",
        decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Username',
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        style: Theme.of(context).textTheme.headline6,
        // keyboardType: KeyboardType,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        validator: (value) => null,
        onChanged: (value) => _username = value,
      );

  Expanded _loginButton(BuildContext context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            color: Theme.of(context).buttonColor,
            onPressed: () {
              debugPrint('Login pressed');
              if (_formKey.currentState.validate()) {
                debugPrint('email = "$_username", password = "$_password"');
                Provider.of<UserRepository>(context, listen: false)
                    .login(_username, _password)
                    .then((_) => {
                          if (Provider.of<UserRepository>(context,
                                      listen: false)
                                  .status ==
                              Status.authenticated)
                            {Navigator.of(context).pop()}
                        });
              }
            },
            child: const Text('Login'),
          ),
        ),
      );

  TextFormField _passwordField() => TextFormField(
        initialValue: "",
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        style: Theme.of(context).textTheme.headline6,
        obscureText: true,
        // keyboardType: KeyboardType,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
        validator: (value) => null,
        onChanged: (value) => _password = value,
      );
}
