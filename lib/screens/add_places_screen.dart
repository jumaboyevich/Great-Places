import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class AddPlacesScreen extends StatelessWidget {
  const AddPlacesScreen({Key? key}) : super(key: key);

  static const routeName = 'add_places_screen';

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
                      ),
                      ImageInput(),
                    ],

                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
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
