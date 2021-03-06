import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/DBHelper.dart';
import 'package:great_places/models/Place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String selectedTitle,
    File selectedImage,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: selectedTitle,
        image: selectedImage,
        location: null);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("user_places", newPlace.toMap());
  }

  Future<void> fetchPlaces() async {
    final dataList = await DBHelper.getPlaces("user_places");
    dataList.map((data) => _items.add(Place(
          id: data['id'],
          title: data['title'],
          location: null,
          image: File(data['image']),
        ))).toList();
    notifyListeners();
  }
}
