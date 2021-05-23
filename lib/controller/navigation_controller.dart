import 'package:get/get.dart';

enum NavigationBar { HomePage, CreatePlacePage, AuthPage }

class NavigationController extends GetxService {
  static NavigationController get to => Get.find();
  RxInt currentIndex = 0.obs;

  // ignore: non_constant_identifier_names
  void changeIndex(int Index) {
    currentIndex(Index);
  }
}
