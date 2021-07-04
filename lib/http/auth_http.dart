import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class AuthHttp {
  static Future signUpHttp(
      String name, String email, String password, filePath) async {
    try {
      String mimeType = mime(filePath);
      String mimee = mimeType.split('/')[0];
      String type = mimeType.split('/')[1];
      print(mimee);
      print(type);

      FormData formData = new FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'image': await MultipartFile.fromFile(filePath,
            filename: 'veggielist.jpg', contentType: MediaType(mimee, type))
      });

      Response response = await Dio().post('url',
          data: formData,
          options: Options(headers: <String, String>{
            //  'Content-Type': 'application/json; charset=UTF-8',
            'Content-Type': "multipart/form-data"
          }));
      return response.data;
      // ignore: dead_code
      print(response.data);
    } on DioError catch (e) {
      return e.response.data;
    } catch (e) {}
  }

  static Future createPlaceHttp(
      String title, String address, String description, filePath) async {
    try {
      final userdata = GetStorage();
      var usertoken = userdata.read('token');
      String mimeType = mime(filePath);
      String mimee = mimeType.split('/')[0];
      String type = mimeType.split('/')[1];
      print(mimee);
      print(type);

      FormData formData = new FormData.fromMap({
        'title': title,
        'address': address,
        'description': description,
        'image': await MultipartFile.fromFile(filePath,
            filename: 'placelist.jpg', contentType: MediaType(mimee, type))
      });

      Response response = await Dio().post('url',
          data: formData,
          options: Options(headers: <String, String>{
            //  'Content-Type': 'application/json; charset=UTF-8',
            'Content-Type': "multipart/form-data",
            'authorization': "Bearer $usertoken"
          }));
      return response.data;
      // ignore: dead_code
      print(response.data);
    } on DioError catch (e) {
      return e.response.data;
    } catch (e) {}
  }
}
