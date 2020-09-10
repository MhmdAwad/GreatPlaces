import 'dart:io';

import 'package:flutter/material.dart';


import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProv;

class ImageSelector extends StatefulWidget {
  final Function saveImageFun;
  ImageSelector(this.saveImageFun);

  @override
  _ImageSelectorState createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  File _imageFile;

  void _takePic() async {
    final imageFile =
    await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 600);
    if(imageFile == null)
      return;
    setState(() {
      _imageFile = File(imageFile.path);
    });
    final appDir = await pathProv.getApplicationDocumentsDirectory();
    final fileName = path.basename(_imageFile.path);
    final savedImage = await _imageFile.copy("${appDir.path}/$fileName");
    widget.saveImageFun(savedImage);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
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
            ),
            label: Text("Select Image"),
            textColor: Theme
                .of(context)
                .primaryColor,
            onPressed: _takePic,
          ),
        )
      ],
    );
  }
}
