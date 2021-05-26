import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_veggielist_app/models/places.dart';

class GetData {
  static Future getPlaces() async {
    var url = Uri.parse('url');
    // Response response = await get(url);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['places'];
      return jsonResponse.map((e) => new Place.fromJson(e)).toList();
    } else {
      return response.statusCode;
    }
  }
}
