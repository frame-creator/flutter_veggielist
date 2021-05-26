import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWork {
  //final String url;
  //NetWork(this.url);

  Future<dynamic> getJson() async {
    var url = Uri.parse('url');
    // Response response = await get(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
