import 'package:get/get.dart';
//import 'package:my_veggielist_app/models/places.dart';
import 'package:my_veggielist_app/http/get_data.dart';

class PlaceController extends GetxController {
  // static PlaceController get to => Get.find();
  //RxList places = List<Place>().obs;
  var isLoading = false.obs;
  RxList places = [].obs;
  @override
  void onInit() {
    fetchPlace();
    super.onInit();
  }

  void fetchPlace() async {
    var placeList = await GetManager.getPlaces();
    if (places != null) {
      places.assignAll(placeList);
      isLoading(true);
    }
  }
}
