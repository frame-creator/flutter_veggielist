import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_veggielist_app/models/places.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  var isLoading = false.obs;
  final userdata = GetStorage();
  //var isLoading = false.obs;
  RxList places = [].obs;
  @override
  void onInit() {
    fetchUserPlaces();
    super.onInit();
  }

  Future<dynamic> getUserPlaces() async {
    var userinfo = userdata.read('username');
    var url = Uri.parse('url');
    // Response response = await get(url);
    final response = await http.get(url);

    //  final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      //  isLoading(true);
      List jsonResponse = json.decode(response.body)['places'];

      //  print(jsonResponse);
      return jsonResponse.map((e) => new Place.fromJson(e)).toList();
    } else {
      return response.statusCode;
    }

    // print(response.body);
    //print(responseData);
    //   print(responseData['token']);
    //  print(responseData['userId']);
  }

  //void
  Future fetchUserPlaces() async {
    var placeList = await getUserPlaces();
    isLoading(true);
    if (places != null) {
      places.assignAll(placeList);
      //    print(placeList);

    }
  }
}
