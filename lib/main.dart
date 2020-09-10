import 'package:flutter/material.dart';
import 'package:great_places/Screens/AddNewPlaceScreen.dart';
import 'package:great_places/Screens/MainScreen.dart';
import 'package:great_places/providers/PlacesProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: MainScreen(),
        routes: {
          AddPlacesScreen.ROUTE_NAME: (_)=>AddPlacesScreen(),

        },
      ),
    );
  }
}
