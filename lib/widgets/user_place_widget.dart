import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:my_veggielist_app/controller/place_widget_controller.dart';
import 'package:my_veggielist_app/models/places.dart';
import 'package:my_veggielist_app/screen/user_page.dart';

class UserPlaceWidget extends StatefulWidget {
  final Place place;
  UserPlaceWidget({Key key, this.place}) : super(key: key);

  @override
  _UserPlaceWidgetState createState() => _UserPlaceWidgetState();
}

class _UserPlaceWidgetState extends State<UserPlaceWidget> {
  PlaceWidgetController _placeWidgetController;
  void _submit() {
    Get.defaultDialog(
        title: '삭제시 복원되지 않습니다.',
        middleText: '정말로 삭제하시겠습니까?',
        textCancel: '취소',
        cancelTextColor: Colors.amber,
        textConfirm: '삭제',
        confirmTextColor: Colors.white,
        onConfirm: () {
          _placeWidgetController.deletePlace(widget.place.id);
        });
  }

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed("/detail/${widget.place.id}");
                            },
                            child: Container(
                                height: 50.0,
                                width: 100.0,
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
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    //textStyle: TextStyle(
                                                    color:
                                                        //Colors.white,
                                                        Color(0xFFF0B690)))))
                            // )
                            ),
                        InkWell(
                            onTap: () {
                              _submit();
                            },
                            child: Container(
                                height: 50.0,
                                width: 100.0,
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
                                        child: Text('삭제',
                                            style:
                                                //GoogleFonts.montserrat(
                                                TextStyle(
                                                    fontFamily:
                                                        'IBMPlexSansKR-Regular',
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    //textStyle: TextStyle(
                                                    color:
                                                        //Colors.white,
                                                        Color(0xFFF0B690)))))
                            // )
                            ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                  ],
                )))
          ],
        ));
  }
}
