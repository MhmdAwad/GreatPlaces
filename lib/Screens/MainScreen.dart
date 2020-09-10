import 'package:flutter/material.dart';
import 'package:great_places/Screens/AddNewPlaceScreen.dart';
import 'package:great_places/providers/PlacesProvider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Great Places"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlacesScreen.ROUTE_NAME);
              },
            )
          ],
        ),
        body: Consumer<PlacesProvider>(
            builder: (_, places, ch) => places.items.isEmpty
                ? ch
                : ListView.builder(
                    itemBuilder: (_, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(places.items[i].image),
                      ),
                      title: Text(places.items[i].title),
                    ),
                    itemCount: places.items.length,
                  ),
            child: Center(child: Text("No places yet. add one"))));
  }
}
