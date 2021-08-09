import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_veggielist_app/screen/create_place_route.dart';
//import 'package:google_fonts/google_fonts.dart';

class DefaultPlaceWidget extends StatelessWidget {
  const DefaultPlaceWidget({Key key}) : super(key: key);

  @override
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
                        image: AssetImage('assets/icons/base.png'
                            // 'https://mybucketthree.s3.ap-northeast-2.amazonaws.com/e6665670-5eff-11eb-b221-91cf234abcaa.png'
                            ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken)))),
            Container(
                height: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Colors.black26, Colors.transparent],
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
                    Text('등록하신 장소가 없습니다.',
                        style: TextStyle(
                            //GoogleFonts.montserrat(
                            fontFamily: 'IBMPlexSansKR-Bold',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),

                    Text('새로운 장소를 등록하시겠습니까?',
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
                          Get.to(RouteCreatePlacePage());
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
                                    child: Text('장소 등록하기',
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
