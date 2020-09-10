import 'package:flutter/material.dart';
import 'package:great_places/Screens/AddPlaceScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Great Places"),
          actions: [
            IconButton(icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlacesScreen.ROUTE_NAME);
            },)
          ],
        ),
        body: Center(child: CircularProgressIndicator(),));
  }
}
