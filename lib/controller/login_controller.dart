import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_veggielist_app/screen/tab.dart';
import 'dart:convert';

//import 'package:my_veggielist_app/http/http_exception.dart';

class AuthController extends GetxService {
  static AuthController get to => Get.find();

  String _token;
  String _userId;
  String _email;
  final userdata = GetStorage();
  var userinfo = ''.obs;

  Future<void> signIn(String email, String password) async {
    final url = Uri.parse('url');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      // print(response.body);
      //  print(responseData);
      // print(responseData['token']);
      //  print(responseData['userId']);

      if (responseData['message'] != null) {
        //  Get.defaultDialog(
        //      onConfirm: () => print("Ok"), middleText: responseData['message']);
        Get.defaultDialog(
            title: '다시 시도해주세요',
            middleText: responseData['message'],
            //   textConfirm: '확인',
            //   confirmTextColor: Colors.amberAccent,
            textCancel: '확인');
        // print(responseData['message']);
        Get.snackbar(
          "다시 시도해주세요",
          responseData['message'],
          snackPosition: SnackPosition.BOTTOM,
        );
        print(responseData['message']);
      }

      _token = responseData['token'];
      _userId = responseData['userId'];
      _email = responseData['email'];

      userdata.write('isLogged', true);
      userdata.write('username', _userId);
      userdata.write('email', _email);
      userdata.write('token', _token);
      var userinfo = await userdata.read('username');
      print(userdata.read('email'));
      print(userinfo);
      if (userinfo != null) {
        Get.offAll(TabPage());
      }
    } catch (error) {
      //    throw error;
      //    print(error.message);
    }
  }
}
