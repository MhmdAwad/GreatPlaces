import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:great_places/Widgets/ImageSelector.dart';
import 'package:great_places/providers/PlacesProvider.dart';
import 'package:provider/provider.dart';

class AddPlacesScreen extends StatefulWidget {
  static const ROUTE_NAME = "AddPlacesScreen";

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  File _pickedImage;
  var _titleController = TextEditingController();

  void _saveImage(File selectedImage) {
    _pickedImage = selectedImage;
  }
  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null)
      return;

    Provider.of<PlacesProvider>(context, listen: false).addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
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
                      ImageSelector(_saveImage)
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
