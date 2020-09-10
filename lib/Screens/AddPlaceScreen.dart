import 'package:flutter/material.dart';

class AddPlacesScreen extends StatefulWidget {
  static const ROUTE_NAME = "AddPlacesScreen";

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Place"),
        ),
        body: Container());
  }
}
