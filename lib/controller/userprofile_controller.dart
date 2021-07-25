import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_veggielist_app/http/auth_http.dart';
import 'package:my_veggielist_app/models/user.dart';

import 'dart:convert';

import 'package:my_veggielist_app/screen/tab.dart';
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
    //  final responseData = json.decode(response.body);
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
      usercolumn.id = userdata.id;
    });
    //  if (user != null) {
    //    places.assignAll(placeList);
    print(user.value.email);
    print(user.value.image);
    print(user.value.name);
    print(user.value.id);
  }

  Future<void> deleteUser(String uid) async {
    try {
      isLoading(true);
      print(uid);
      if (uid != null) {
        var response = await AuthHttp.deleteUserHttp(uid);
        print(response);
        //   print(response['userId']);
        if (response != null) {
          userdata.erase();
          Get.offAll(TabPage());
        }

        //  Get.to(UserPage());
        //   final responseData = json.decode(response.body);
        //   print(responseData);
        if (response['message'] != null
            //&&
            //    response['message'] != '계정이 삭제되었습니다.'
            ) {
          Get.snackbar("감사합니다.", response['message'],
              // Get.snackbar("다시 시도해주세요", response['message'],
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }

        print(response['message']);
        // Get.defaultDialog(
        //     onConfirm: () => print("Ok"), middleText: responseData['message']);
        //    Get.defaultDialog(
        //        title: '다시 시도해주세요',
        //        middleText: response['message'],
        //   textConfirm: '확인',
        //   confirmTextColor: Colors.amberAccent,
        //         textCancel: '확인');

        //         //  throw HttpException(responseData['message']);
        //       }
      }
    } catch (error) {
      throw error;
    } finally {
      isLoading(false);
    }
  }
}
