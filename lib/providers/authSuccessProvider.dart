import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSuccessProvider extends ChangeNotifier {
  bool authSuccess = false;
  authIsSuccess(bool success) async {
    // final prefs = await SharedPreferences.getInstance();
    authSuccess = success;

    // prefs.setString("token", "");
    notifyListeners();
  }
}
