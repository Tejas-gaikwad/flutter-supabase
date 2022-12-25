import 'package:flutter/cupertino.dart';

class LoadingProvider extends ChangeNotifier {
  bool load = false;

  void isLoading(bool isLoading) {
    load = isLoading;
    notifyListeners();
  }
}
