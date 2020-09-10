import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/models/Place.dart';

class PlacesProvider with ChangeNotifier {

  List<Place> _items = [];


  List<Place> get items {
    return [..._items];
  }



}