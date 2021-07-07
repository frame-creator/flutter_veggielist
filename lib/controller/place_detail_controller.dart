import 'package:get/get.dart';
import 'package:my_veggielist_app/controller/place_controller.dart';
import 'package:my_veggielist_app/models/places.dart';

import 'place_widget_controller.dart';

class PlaceDetailController extends GetxController {
  Rx<Place> place = Place().obs;

  @override
  void onInit() {
    PlaceWidgetController placeWidgetController =
        Get.find(tag: Get.parameters["id"]);
    place(placeWidgetController.place);
    super.onInit();
  }
}
