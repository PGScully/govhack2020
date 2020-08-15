import 'package:flutter/material.dart';

import 'package:twp/auth/status.dart';

/// Manage the user authentication, etc.
class UserRepository with ChangeNotifier {
  Status _status = Status.uninitialized;
  String _userId = '';

  UserRepository() {
    _status = Status.unauthenticated;
    notifyListeners();
  }

  Status get status => _status;
  String get userId => _userId;

  Future<void> login(String username, String password) async {
    debugPrint('Login with username = "$username", password = "$password"');
    _userId = username;
    _status = Status.authenticated;
    notifyListeners();
  }

  Future<void> logout() async {
    debugPrint('Logout');
    _userId = '';
    _status = Status.unauthenticated;
    notifyListeners();
  }
}
