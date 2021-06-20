import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/http/auth_http.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var imageURL = '';

  Future<void> signUp(
      String name, String email, String password, filePath) async {
    try {
      isLoading(true);
      if (filePath != null) {
        var response =
            await AuthHttp.signUpHttp(name, email, password, filePath);
        print(response);
        //   final responseData = json.decode(response.body);
        //   print(responseData);
        if (response['message'] != null) {
          Get.snackbar("다시 시도해주세요", response['message'],
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
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
