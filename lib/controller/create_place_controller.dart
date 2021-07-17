import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_veggielist_app/controller/userpage_controller.dart';
import 'package:my_veggielist_app/http/auth_http.dart';
import 'package:my_veggielist_app/screen/tab.dart';

class CreatePlaceController extends GetxController {
  var isLoading = false.obs;
  final userdata = GetStorage();
  UserController usercontroller = Get.put(UserController());

  Future<void> createPlace(
      String title, String address, String description, filePath) async {
    try {
      isLoading(true);
      if (filePath != null) {
        var response = await AuthHttp.createPlaceHttp(
            title, address, description, filePath);
        print(response);
        //   print(response['userId']);
        if (response
            //['userId']
            !=
            null) {
          usercontroller.fetchUserPlaces();
          Get.snackbar("장소가 등록되었습니다.", "감사합니다.",
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
          Get.offAll(TabPage());
        }
        //   final responseData = json.decode(response.body);
        //   print(responseData);
        if (response['message'] != null &&
            response['message'] != '인증에 실패하였습니다.') {
          Get.snackbar("장소가 등록되지 않았습니다.", response['message'],
              // Get.snackbar("다시 시도해주세요", response['message'],
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        } else if (response['message'] == '인증에 실패하였습니다.') {
          Get.snackbar("장소가 등록되지 않았습니다.", '로그인해주세요.',
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
