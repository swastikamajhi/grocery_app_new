import 'package:flutter/widgets.dart';

class FavouritesProvider with ChangeNotifier {
  List<String> _favouriteItems = [];

  List<String> get favouriteItems => _favouriteItems;

  void addFavouriteItems(String item) {
    _favouriteItems.add(item);
    notifyListeners();
  }

  void removeFavouriteItem(String item) {
    _favouriteItems.remove(item);
    notifyListeners();
  }

  void clearAllFavouriteItems() {
    _favouriteItems.clear();
    notifyListeners();
  }
}
