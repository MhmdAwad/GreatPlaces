import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:great_places/Widgets/ImageSelector.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/providers/PlacesProvider.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class AddPlacesScreen extends StatefulWidget {
  static const ROUTE_NAME = "AddPlacesScreen";

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  File _pickedImage;
  String locationImageUrl;
  var _titleController = TextEditingController();

  void _saveImage(File selectedImage) {
    _pickedImage = selectedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) return;

    Provider.of<PlacesProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  Future<void> _getUserLocation() async{
    final locationData = await Location.instance.getLocation();
    final locationImage = LocationHelper.generateLocationPreviewImage(latitude: locationData.latitude,
    longitude: locationData.longitude);
    print(locationImage);
    setState(() {
      locationImageUrl = locationImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Place"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Title"),
                        controller: _titleController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ImageSelector(_saveImage),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: locationImageUrl == null
                            ? Text(
                                "No Location Chosen",
                                textAlign: TextAlign.center,
                              )
                            : Image.network(
                                locationImageUrl,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton.icon(
                            icon: Icon(Icons.add_location),
                            label: Text("Current Location"),
                            textColor: Theme.of(context).primaryColor,
                            onPressed: _getUserLocation,
                          ),
                          FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.map),
                            label: Text("Select on Map"),
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      )
                    ],
                  )),
              RaisedButton.icon(
                icon: Icon(Icons.add),
                label: Text(
                  "Add Place",
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Theme.of(context).accentColor,
                onPressed: _savePlace,
              )
            ]));
  }
}
