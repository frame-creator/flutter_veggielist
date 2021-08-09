import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:my_veggielist_app/controller/place_widget_controller.dart';
import 'package:my_veggielist_app/models/places.dart';

class PlaceWidget extends StatefulWidget {
  final Place place;
  PlaceWidget({Key key, this.place}) : super(key: key);

  @override
  _PlaceWidgetState createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  // ignore: unused_field
  PlaceWidgetController _placeWidgetController;
  @override
  void initState() {
    _placeWidgetController = Get.put(PlaceWidgetController(place: widget.place),
        tag: widget.place.id);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 20),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  image: DecorationImage(
                      image: NetworkImage(widget.place.image
                          // 'https://mybucketthree.s3.ap-northeast-2.amazonaws.com/e6665670-5eff-11eb-b221-91cf234abcaa.png'
                          ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken))),
            ),
            Container(
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                )),
            Container(
                height: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.symmetric(vertical: 0.0),
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(FontAwesomeIcons.mapMarkerAlt,
                          //Icons.food_bank_outlined,
                          size: 30,
                          color: Colors.white70),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.place.title,
                          style: TextStyle(
                              //GoogleFonts.montserrat(
                              fontFamily: 'IBMPlexSansKR-Bold',
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ]),
                    Text(widget.place.address,
                        style: TextStyle(
                            fontFamily: 'IBMPlexSansKR-Medium',
                            //GoogleFonts.montserrat(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    //textStyle: TextStyle(color: Colors.white))),
                    SizedBox(height: 20.0),
                    InkWell(
                        onTap: () {
                          Get.toNamed("/detail/${widget.place.id}");
                        },
                        child: Container(
                            height: 50.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white70.withOpacity(0.25),
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
                                    child: Text('지도확인',
                                        style:
                                            //GoogleFonts.montserrat(
                                            TextStyle(
                                                fontFamily:
                                                    'IBMPlexSansKR-Regular',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                //textStyle: TextStyle(
                                                color:
                                                    //Colors.white,
                                                    Color(0xFFF0B690)))))
                        // )
                        ),
                    SizedBox(height: 30.0),
                  ],
                )))
          ],
        ));
  }
}

/*
    Stack(children: <Widget>[
      Padding(
          padding: EdgeInsets.all(25.0),
          child: Container(
            height: 300.0,
            width: 375.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://mybucketthree.s3.ap-northeast-2.amazonaws.com/b2916140-6059-11eb-ad41-491e70665e2e.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken))),
          )),
      Positioned(
          top: 225.0,
          left: 40.0,
          child: Container(
              width: MediaQuery.of(context).size.width - 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('오세계향',
                          style: GoogleFonts.montserrat(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              textStyle: TextStyle(color: Colors.white))),
                      Text(
                        '서울 서초구 우면동',
                        style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            textStyle: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white),
                    child: Center(
                      child: Icon(Icons.place,
                          color: Color(0xFFFD4F99), size: 14.0),
                    ),
                  )
                ],
              )))
    ]);
  }
}
    
    
        Container(
            margin: EdgeInsets.symmetric(vertical: 12.0),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            color: Colors.grey)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '오세계향',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Text(
                            '서울 서초구 우면동',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          '텍스트',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }
}
*/
