import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_veggielist_app/models/user.dart';
import 'package:my_veggielist_app/screen/tab.dart';
import 'package:my_veggielist_app/screen/user_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
//import 'package:my_veggielist_app/http/http_exception.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  var isLoading = false.obs;
  Rx<User> user = User().obs;
  final userdata = GetStorage();

  @override
  void onInit() {
    getUserProfile();
    fetchUserProfile();
    super.onInit();
  }

  Future<User> getUserProfile() async {
    var userinfo = userdata.read('username');
    final url = Uri.parse('url');

    final response = await http.get(url);
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      isLoading(true);
      var jsonResponse = json.decode(response.body)['user'];
      print(response.statusCode);
      print(response.body);
      print(jsonResponse);
      print(new User.fromJson(jsonResponse));
      return new User.fromJson(jsonResponse);

      // } else {
      //     return response.statusCode;
      //  profileName = jsonResponse['name'];
      //   image = jsonResponse['image'];

      //   userdata.write('profilename', profileName);
      //   userdata.write('image', image);
      // var userprofile = await userdata.read('profilename');
      //   print(userdata.read('profilename'));
      //  print(userprofile);
    } else {
      return Future.error(response.statusCode);
      //response.statusCode;
    }

    // print(response.body);
    //  print(responseData);
    // print(responseData['token']);
    //  print(responseData);
  }

  void fetchUserProfile() async {
    User userdata = await getUserProfile();
    user.update((usercolumn) {
      usercolumn.name = userdata.name;
      usercolumn.image = userdata.image;
      usercolumn.email = userdata.email;
    });
    //  if (user != null) {
    //    places.assignAll(placeList);
    print(user.value.email);
    print(user.value.image);
    print(user.value.name);
  }
}
