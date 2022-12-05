import 'package:flutter/material.dart';
import 'package:great_places/screens/add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
