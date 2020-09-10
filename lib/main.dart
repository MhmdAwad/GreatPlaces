import 'package:flutter/material.dart';
import 'package:great_places/Screens/AddNewPlaceScreen.dart';
import 'package:great_places/Screens/MainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber
      ),
      home: MainScreen(),
      routes: {
        AddPlacesScreen.ROUTE_NAME: (_)=>AddPlacesScreen(),

      },
    );
  }
}
