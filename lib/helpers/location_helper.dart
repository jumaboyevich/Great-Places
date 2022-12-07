import 'dart:convert';

import 'package:http/http.dart' as http;
// const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';
const GOOGLE_API_KEY = 'AIzaSyBxqryQfB7TX436o3QAh8EUI3oYRK_xy1E';

class LocationHelper {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}