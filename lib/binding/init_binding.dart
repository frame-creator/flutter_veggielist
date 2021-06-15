import 'package:get/get.dart';

import 'package:my_veggielist_app/controller/navigation_controller.dart';
//import 'package:my_veggielist_app/repository/place_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());

    //Get.put<AuthController>(AuthController(), permanent: true);
    //   Get.put(PlaceRepository(), permanent: true);
  }
}
