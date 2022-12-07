import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import 'package:provider/provider.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = 'add_places_screen';

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titlecontroller = TextEditingController();

  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _selectImage(File file) {
    _pickedImage = file;
  }

  void _selectPlace(double lat, double long) {
    _pickedLocation=PlaceLocation(longitude: long, latitude: lat);
  }

  void savePlace() {
    if (_titlecontroller.text.isEmpty || _pickedImage == null || _pickedLocation==null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlaces(_titlecontroller.text, _pickedImage, _pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a new pLace Screen'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(label: Text('Title')),
                        controller: _titlecontroller,
                      ),
                      ImageInput(_selectImage),
                      SizedBox(
                        height: 10,
                      ),
                      LocationInput(_selectPlace),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: savePlace,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: Theme.of(context).accentColor,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            )
          ],
        ));
  }
}
