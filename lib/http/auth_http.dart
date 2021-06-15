import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthHttp {
  static Future<dynamic> SignUpHttp(
      String name, String email, String password, filePath) async {
    try {
      FormData formData = new FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'image': await MultipartFile.fromFile(filePath, filename: 'dp')
      });

      Response response = await Dio().put(
        'url',
        data: formData,
        //options: Options(headers: <String, String>{
        //  'Content-Type': 'application/json; charset=UTF-8',
        //})
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {}
  }
}
