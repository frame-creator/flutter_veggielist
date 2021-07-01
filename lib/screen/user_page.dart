import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_veggielist_app/controller/userpage_controller.dart';
import 'package:my_veggielist_app/controller/userprofile_controller.dart';
import 'package:my_veggielist_app/screen/tab.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> with TickerProviderStateMixin {
  TabController tabController;

  final userdata = GetStorage();

  final UserController usercontroller = Get.put(UserController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
          userProfile(),
          userPlace(),
        ]));
  }

  Widget userProfile() {
    final ProfileController profilecontroller = Get.put(ProfileController());

    return Obx(() {
      if (profilecontroller.isLoading.value == false) {
        return Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.yellow,
        ));
      } else {
        return
            //Scaffold(
            //    body: ListView(
            //   children: <Widget>[

            Stack(
          children: <Widget>[
            Container(height: 300.0),
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/1.jpg'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 150.0,
              left: 25.0,
              child: Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(70.0),
                    image: DecorationImage(
                        image: (profilecontroller.user.value.image == null)
                            ? AssetImage('assets/images/2.jpg')
                            : NetworkImage(profilecontroller.user.value.image),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: 225.0,
              left: 175.0,
              child: Row(children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      (profilecontroller.user.value.name == null)
                          ? '프로필 이름'
                          : profilecontroller.user.value.name,
                      style: TextStyle(
                          fontFamily: 'SDSamliphopangcheOutline',
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (profilecontroller.user.value.email == null)
                          ? '이메일 주소'
                          : profilecontroller.user.value.email,
                      style: TextStyle(
                          fontFamily: 'SDSamliphopangcheOutline',
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 15.0),
                Container(
                  height: 30.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFF3B287),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: TextButton(
                    onPressed: () {
                      userdata.erase();
                      Get.off(TabPage());
                    },
                    child: Text('로그아웃',
                        style: TextStyle(
                            fontFamily: 'IBMPlexSansKR-Regular',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ]),
            ),
          ],
        );
      }
    });
//      ],
//    )
    //   );
  }

  Widget userPlace() {
    return Obx(() {
      //  if (usercontroller.isLoading.value == false) {
      //    return Center(
      //        child: CircularProgressIndicator(
      //      backgroundColor: Colors.yellow,
      //     ));
      //   } else {
      if (usercontroller.places.length == null ||
          usercontroller.places.length == 0) {
        return Text('등록하신 장소가 없습니다.');
      } else {
        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: usercontroller.places.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              var singlePlace = usercontroller.places[index];
              return Padding(
                  padding: EdgeInsets.all(17.0),
                  child: InkWell(
                      onTap: () {},
                      child: Stack(children: <Widget>[
                        Container(
                          height: 270.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: NetworkImage(singlePlace.image),
                                  //              //  '${recipepost['img_url']}'),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 270.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        Positioned(
                          top: 10.0,
                          left: 10.0,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                width: 110.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.black.withOpacity(0.2)),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Icon(Icons.star, color: Colors.white, size: 12.0),
                                    // SizedBox(width: 5.0),

                                    Text(
                                      '자세히보기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                )),
                              ),
                              //   SizedBox(width: 50.0),
                              //   Text(
                              //    'More',
                              //    style: TextStyle(
                              //        color: Colors.white,
                              //fontFamily: 'Opensans'
                              //        ),
                              //  ),
                              // SizedBox(width: 7.0),
                              //this should be an iconbutton in a real app.
                              //   Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                            ],
                          ),
                        ),
                        Positioned(
                          top: 55.0,
                          left: 20.0,
                          child: Container(
                            width: 220.0,
                            child: Text(singlePlace.title,
                                style: TextStyle(
                                  //  fontFamily: 'Opensans',
                                  fontSize: 30.0,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Positioned(
                            top: 200.0,
                            left: 20.0,
                            child: Row(children: [
                              Text('',
                                  style: TextStyle(
                                      //       fontFamily: 'Opensans',
                                      fontSize: 30.0,
                                      color: Colors.white)
                                  // fontWeight: FontWeight.w600)
                                  ),
                              // SizedBox(width: 15.0),
                              Stack(children: <Widget>[
                                Container(height: 40.0, width: 100.0),
                                //Container(
                                //  height: 60.0,
                                //  width: 60.0,
                                //  decoration: BoxDecoration(
                                //      borderRadius: BorderRadius.circular(100.0),
                                //  CircleAvatar(
                                //    backgoundImage:  NetworkImage("https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg"),
                                //
                                Positioned(
                                  left: 10.0,
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    //      image: DecorationImage(
                                    //    image: NetworkImage(document['chef_img']), fit: BoxFit.cover)),
                                    child: Center(
                                      child: Text('',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black)),
                                    ),
                                  ),
                                )
                              ]),
                            ]))
                      ])));
            });
      }
    }
        //}
        );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/controller/place_controller.dart';
import 'package:my_veggielist_app/controller/userpage_controller.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserController placecontroller = Get.put(UserController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Obx(() {
        if (placecontroller.isLoading.value == false) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          ));
        } else {
          return Expanded(
              child: ListView.builder(
                  itemCount: placecontroller.places.length,
                  itemBuilder: (BuildContext context, index) {
                    var singlePlace = placecontroller.places[index];
                    return Padding(
                        padding: EdgeInsets.all(17.0),
                        child: InkWell(
                            onTap: () {},
                            child: Stack(children: <Widget>[
                              Container(
                                height: 270.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: NetworkImage(singlePlace.image),
                                        //              //  '${recipepost['img_url']}'),
                                        fit: BoxFit.cover)),
                              ),
                              //make the shade a bit deeper.
                              Container(
                                height: 270.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              Positioned(
                                top: 10.0,
                                left: 10.0,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 110.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: Colors.black.withOpacity(0.2)),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Icon(Icons.star, color: Colors.white, size: 12.0),
                                          // SizedBox(width: 5.0),

                                          Text(
                                            '자세히보기',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ],
                                      )),
                                    ),
                                    //   SizedBox(width: 50.0),
                                    //   Text(
                                    //    'More',
                                    //    style: TextStyle(
                                    //        color: Colors.white,
                                    //fontFamily: 'Opensans'
                                    //        ),
                                    //  ),
                                    // SizedBox(width: 7.0),
                                    //this should be an iconbutton in a real app.
                                    //   Icon(Icons.arrow_drop_down, color: Colors.white, size: 25.0)
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 55.0,
                                left: 20.0,
                                child: Container(
                                  width: 220.0,
                                  child: Text(singlePlace.title,
                                      style: TextStyle(
                                        //  fontFamily: 'Opensans',
                                        fontSize: 30.0,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              Positioned(
                                  top: 200.0,
                                  left: 20.0,
                                  child: Row(children: [
                                    Text('',
                                        style: TextStyle(
                                            //       fontFamily: 'Opensans',
                                            fontSize: 30.0,
                                            color: Colors.white)
                                        // fontWeight: FontWeight.w600)
                                        ),
                                    // SizedBox(width: 15.0),
                                    Stack(children: <Widget>[
                                      Container(height: 40.0, width: 100.0),
                                      //Container(
                                      //  height: 60.0,
                                      //  width: 60.0,
                                      //  decoration: BoxDecoration(
                                      //      borderRadius: BorderRadius.circular(100.0),
                                      //  CircleAvatar(
                                      //    backgoundImage:  NetworkImage("https://i.pinimg.com/564x/e3/54/e9/e354e97bf5d17326c3c361d884707e2c.jpg"),
                                      //
                                      Positioned(
                                        left: 10.0,
                                        child: Container(
                                          height: 40.0,
                                          width: 40.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          //      image: DecorationImage(
                                          //    image: NetworkImage(document['chef_img']), fit: BoxFit.cover)),
                                          child: Center(
                                            child: Text('',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ]))
                            ])));
                  }));
        }
      })
    ]));
  }
}
*/
