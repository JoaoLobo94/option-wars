import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JwtProvider extends ChangeNotifier {
  String? _jwt;

  String? get jwt => _jwt;

  JwtProvider() {
    _loadJwtFromStorage();
  }

  Future<void> _loadJwtFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _jwt = prefs.getString('jwt');
    notifyListeners();
  }

  Future<void> saveJwtToStorage(String jwt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
    _jwt = jwt;
    notifyListeners();
  }
}
