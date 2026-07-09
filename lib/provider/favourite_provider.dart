import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favList = [];

  List<int> get favList => _favList;

  void markFavourite(int value) {
    _favList.add(value);
    notifyListeners();
  }

  void unmarkFavourite(int value) {
    _favList.remove(value);
    notifyListeners();
  }
}
