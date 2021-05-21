import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/controller/navigation_controller.dart';

class TabPage extends GetView<NavigationController>
//StatelessWidget
{
  const TabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
      () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          //0,
          showSelectedLabels: true,
          selectedItemColor: Colors.amber,
          onTap: controller.changeIndex,
          //print(index);

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              activeIcon: Icon(Icons.food_bank),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_outlined),
              activeIcon: Icon(Icons.featured_play_list),
              label: '등록',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              activeIcon: Icon(Icons.book_rounded),
              label: 'MY',
            ),
          ]),
    ));
  }
}
