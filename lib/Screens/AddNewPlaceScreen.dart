import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddPlacesScreen extends StatefulWidget {
  static const ROUTE_NAME = "AddPlacesScreen";

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  File _imageFile;

  void _takePic() async {
    final imageFile =
        await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _imageFile = File(imageFile.path);
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
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "Title"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: _imageFile == null
                                ? Text(
                                    "No Image!",
                                    textAlign: TextAlign.center,
                                  )
                                : Image.file(
                                    _imageFile,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: FlatButton.icon(
                              icon: Icon(
                                Icons.camera,
                                color: Theme.of(context).primaryColor,
                              ),
                              label: Text("Select Image"),
                              textColor: Theme.of(context).primaryColor,
                              onPressed: _takePic,
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              RaisedButton(
                child: Text(
                  "Add Place",
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Theme.of(context).accentColor,
                onPressed: () {},
              )
            ]));
  }
}
