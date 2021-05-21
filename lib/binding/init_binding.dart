import 'package:get/get.dart';
import 'package:my_veggielist_app/controller/navigation_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
