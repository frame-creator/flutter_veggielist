import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_veggielist_app/controller/userpage_controller.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  final userdata = GetStorage();
  final UserController usercontroller = Get.put(UserController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Obx(() {
        if (usercontroller.isLoading.value == false) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          ));
        } else {
          return Expanded(
              child: ListView.builder(
                  itemCount: usercontroller.places.length,
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