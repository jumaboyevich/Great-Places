import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/helpers/location_helper.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlaces(String pickedTitle, File? pickedImage,
      PlaceLocation pickedLocation) async {
    final address = await LocationHelper.getPlaceAddress(
        pickedLocation.latitude, pickedLocation.longitude);
    final updateLocation = PlaceLocation(
        longitude: pickedLocation.longitude,
        latitude: pickedLocation.latitude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: pickedTitle,
        location: updateLocation,
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!.path,
      'loc_lat': newPlace.location!.latitude,
      'loc_lng': newPlace.location!.longitude,
      'address': newPlace.location!.address!,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
            image: File(item['image'])))
        .toList();
    notifyListeners();
  }
}
