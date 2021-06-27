import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_veggielist_app/controller/navigation_controller.dart';
import 'package:my_veggielist_app/screen/create_place.dart';

import 'package:my_veggielist_app/screen/home_page.dart';
import 'package:my_veggielist_app/screen/login_page.dart';
import 'package:my_veggielist_app/screen/user_page.dart';

class TabPage extends GetView<NavigationController>
//StatelessWidget
{
  const TabPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userdata = GetStorage();
    return Scaffold(
        // body: MyHomePage(),
        // ignore: missing_return
        body: Obx(() {
          switch (NavigationBar.values[controller.currentIndex.value]) {
            case NavigationBar.HomePage:
              return HomePage();
              break;
            case NavigationBar.CreatePlacePage:
              return
                  //UserPlacePage();
                  CreatePlacePage();
              //PlaceDetailPage();
              break;
            case NavigationBar.AuthPage:
              if (userdata.read('username') == null) {
                return
                    //SignUpPage();
                    LoginPage();
              } else {
                return UserPage();
              }
              break;
          }
          return Container();
        }),
        bottomNavigationBar: Obx(() =>
            //BottomNavigationBar(
            //    type: BottomNavigationBarType.fixed,
            //   currentIndex: controller.currentIndex.value,
            //    //0,
            //    showSelectedLabels: true,
            //    selectedItemColor: Colors.amber,
            //    onTap: controller.changeIndex,
            //print(index);
            CurvedNavigationBar(
              index: controller.currentIndex.value,
              onTap: controller.changeIndex,
              color: Color(0xFFF0B690),
              backgroundColor: Colors.white,
              buttonBackgroundColor: Color(0xFFF3A470),
              items: <Widget>[
                Icon(FontAwesomeIcons.mapMarkerAlt,
                    //Icons.food_bank_outlined,
                    size: 40,
                    color: Colors.white),

                Icon(FontAwesomeIcons.edit,
                    //  Icons.featured_play_list_outlined,
                    size: 40,
                    color: Colors.white),
                //ImageIcon(AssetImage("assets/icons/search.png"), size: 30)
                //   title: Text(''),
                Icon(FontAwesomeIcons.userAstronaut,
                    // Icons.book_outlined,
                    size: 40,
                    color: Colors.white),
              ],
              animationDuration: Duration(milliseconds: 200),
              animationCurve: Curves.easeIn,
            )));
  }
}

/*
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
*/
