import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/http/auth_http.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var imageURL = '';

  void SignUp(String name, String email, String password, filePath) async {
    try {
      isLoading(true);
      if (filePath != null) {
        var response =
            await AuthHttp.SignUpHttp(name, email, password, filePath);
        final responseData = json.decode(response.body);
        print(responseData);
        if (responseData['message'] != null) {
          // Get.snackbar("다시 시도해주세요", responseData['message'],
          // margin: EdgeInsets.only(top: 5, left: 10, right: 10));
          // Get.defaultDialog(
          //     onConfirm: () => print("Ok"), middleText: responseData['message']);
          Get.defaultDialog(
              title: '다시 시도해주세요',
              middleText: responseData['message'],
              //   textConfirm: '확인',
              //   confirmTextColor: Colors.amberAccent,
              textCancel: '확인');
          print(responseData['message']);

          //  throw HttpException(responseData['message']);
        }
      }
    } catch (error) {
      throw error;
    } finally {
      isLoading(false);
    }
  }
}
