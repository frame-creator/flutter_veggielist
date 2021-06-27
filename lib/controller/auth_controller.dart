

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/http/auth_http.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;

  Future<void> signUp(
      String name, String email, String password, filePath) async {
    try {
      isLoading(true);
      if (filePath != null) {
        var response =
            await AuthHttp.signUpHttp(name, email, password, filePath);
        print(response);
        print(response['userId']);
        if (response['userId'] != null) {
          Get.back();
          Get.snackbar("회원가입되었습니다.", "로그인해주세요.",
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
        //   final responseData = json.decode(response.body);
        //   print(responseData);
        if (response['message'] != null &&
            response['message'] != '회원가입이 되지 않았습니다. 다시 한번 시도해주세요.') {
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
