import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/controller/place_controller.dart';
import 'package:my_veggielist_app/screen/create_place_route.dart';

import 'package:my_veggielist_app/widgets/place_widget.dart';
import 'package:my_veggielist_app/widgets/progress_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PlaceController placecontroller = Get.put(PlaceController());
  AnimationController _animationController;
  bool _sideMoved = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //Container(
            //    color: const Color(0xFFF3DBCB),
            //    child:
            Stack(children: <Widget>[
      ListView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            //  homeAppBar(),
            homeWelcome(),
            homePlaces(),
          ]),
      sideDrawer(),
    ])
        // )
        );
  }

/*
  Widget homeAppBar() {
    return Stack(children: <Widget>[
      /*Container(
          height: 430.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.red[200]]),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0)),
            color:
                //Color(0xFFFE8A7E)
                //Color(0xFFFD7465)
                Colors.red[100],
          )),*/
      Container(
          height: 100.0,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.0)),
            color:
                //Color(0xFFFE8A7E)
                //Color(0xFFFD7465)
                Colors.white,
          )),
      /*   Container (
          height: 160.0,
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.only(bottomLeft: Radius.circular(75.0)),
            color: 
            Colors.pink[100]
            //Color(0xFFFE8A7E)
            //Color(0xFFFD7465)
            //Colors.red[50],
          )),
          */
      Container(
          height: 100.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.orangeAccent[100], Color(0xFFF0B690)]),
              //   borderRadius:
              //       BorderRadius.only(bottomLeft: Radius.circular(75.0)),
              color:
                  //Color(0xFFFE8A7E)
                  Colors.red[200])),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              
            },

            icon: Icon(FontAwesomeIcons.bars,
                //Icons.food_bank_outlined,
                size: 30,
                color: Colors.white),

            //semanticLabel: 'Show menu',
            //iconSize: 36,
            //color: Colors.black87,
          ),

          //iconSize: 36,
          // color: Colors.black87,

          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(5),
                child: ImageIcon(AssetImage("assets/icons/base.png"),
                    size: 40, color: Colors.white)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('베지리스트',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansKR-Bold',
                      fontSize: 35.0,
                      color: Colors.white)),
            ),
          ]),
          SizedBox(width: 45),
        ],
      ),
    ]);
  }
*/
  Widget homeWelcome() {
    return Stack(children: <Widget>[
      Container(height: 410.0),
      Container(
        height: 400.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/ve.gif'), fit: BoxFit.cover)),
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              //Get.to(SideDrawer());
              //   _sideMoved
              //       ? _animationController.forward()
              //       : _animationController.reverse();
              setState(() {
                _sideMoved = !_sideMoved;
              });
            },

            icon: Icon(FontAwesomeIcons.bars,
                //Icons.food_bank_outlined,
                size: 30,
                color: Colors.white),

            //semanticLabel: 'Show menu',
            //iconSize: 36,
            //color: Colors.black87,
          ),

          //iconSize: 36,
          // color: Colors.black87,

          Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.all(5),
                child: ImageIcon(AssetImage("assets/icons/base.png"),
                    size: 40, color: Colors.white)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('베지리스트',
                  style: TextStyle(
                      fontFamily: 'IBMPlexSansKR-Bold',
                      fontSize: 35.0,
                      color: Colors.white)),
            ),
          ]),
          SizedBox(width: 45),
        ],
      ),
      Container(
          height: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.symmetric(vertical: 0.0),
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('내가 찾던 채식 식당 리스트',
                  style: TextStyle(
                      //GoogleFonts.montserrat(
                      fontFamily: 'IBMPlexSansKR-Bold',
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 20.0),
              InkWell(
                  onTap: () {
                    Get.to(RouteCreatePlacePage());
                  },
                  child: Container(
                      height: 50.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFF0B690)
                          //Colors.white70.withOpacity(0.25),
                          //  border: Border.all(
                          //      color: Color(0xFFF0B690), width: 1),
                          ),
                      child:
                          //ClipOval(
                          //    child: BackdropFilter(
                          //        filter:
                          //            ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          //        child:
                          Center(
                              child: Text('등록하기',
                                  style:
                                      //GoogleFonts.montserrat(
                                      TextStyle(
                                          fontFamily: 'IBMPlexSansKR-Regular',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          //textStyle: TextStyle(
                                          color:
                                              //Colors.white,
                                              //Color(0xFFF0B690)
                                              Colors.white))))
                  // )
                  ),
              SizedBox(height: 30.0),
            ],
          )))
    ]);
  }

  Widget homePlaces() {
    return
        //Scaffold(
        //     body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Obx(() {
      if (placecontroller.isLoading.value == false) {
        return
            //MyProgressIndicator();
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Center(
                  //    child: Image.asset('assets/icons/loading.gif'));
                  child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/icons/loading.gif')))
            ]); //Center(
        //    child: CircularProgressIndicator(
        //   backgroundColor: Colors.yellow,
        // ));
      } else {
        return
            //   Expanded(
            //       child:
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: placecontroller.places.length,
                itemBuilder: (BuildContext context, index) {
                  //   var singlePlace = placecontroller.places[index];
                  return PlaceWidget(place: placecontroller.places[index]);
                });
        //  );
      }
    }
            //    )
            //  ])
            );
  }

  Widget sideDrawer() {
    return AnimatedContainer(
      width: Get.width / 2,
      curve: Curves.easeIn,
      color: Colors.white,
      duration: Duration(milliseconds: 720),
      transform: Matrix4.translationValues(
        _sideMoved ? 0 : -Get.width / 2,
        0,
        0,
      ),
      child: SafeArea(
          child: SizedBox(
              width: Get.width / 2,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          //Get.to(SideDrawer());
                          _sideMoved
                              ? _animationController.reverse()
                              : _animationController.forward();
                          setState(() {
                            _sideMoved = !_sideMoved;
                          });
                        },

                        icon: Icon(FontAwesomeIcons.times,
                            //Icons.food_bank_outlined,
                            size: 30,
                            color: Colors.amber),

                        //semanticLabel: 'Show menu',
                        //iconSize: 36,
                        //color: Colors.black87,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: ImageIcon(AssetImage("assets/icons/base.png"),
                          size: 120, color: Colors.orange[200])),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _sideMoved = !_sideMoved;
                      });
                    },
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(FontAwesomeIcons.paperPlane,
                                size: 30.0, color: Colors.orange[200]),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                              child: Text(
                            '문의하기',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'IBMPlexSansKR-Medium',
                                color: Colors.black54,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                        ])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Image(
                          image: AssetImage('assets/images/7.jpg'),
                          fit: BoxFit.cover))
                ],
              ))),
    );
  }
}
/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/controller/place_controller.dart';
import 'package:my_veggielist_app/screen/place_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlaceController placecontroller = Get.put(PlaceController());

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
                            onTap: () {
                              Get.toNamed(
                                  '/detail/${placecontroller.places[index].id}');
                              print(singlePlace);
                            },
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
                                            '지도 확인',
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
