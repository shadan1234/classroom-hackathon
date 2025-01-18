// lib/models/user_role.dart
import 'package:flutter/material.dart';

enum UserRole {
  faculty,
  ta,
  student,
}

class User {
  final String name;
  final UserRole role;

  User({required this.name, required this.role});
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
