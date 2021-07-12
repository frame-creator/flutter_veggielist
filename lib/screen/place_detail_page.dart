/*import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_veggielist_app/controller/place_detail_controller.dart';
import 'package:my_veggielist_app/controller/place_widget_controller.dart';
import 'package:my_veggielist_app/models/places.dart';
import 'package:get/get.dart';

class PlaceDetailPage extends StatefulWidget {
  final Place place;

  const PlaceDetailPage({Key key, this.place}) : super(key: key);

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  var placeId = Get.parameters['id'];
  PlaceDetailController _placeDetailController;

  @override
  void initState() {
    _placeDetailController = Get.put(
      PlaceDetailController(),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(_placeDetailController.place.value.image),
    ));
  }
}
*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_veggielist_app/controller/place_detail_controller.dart';
import 'package:my_veggielist_app/models/places.dart';

class PlaceDetailPage extends StatefulWidget {
  final Place place;

  const PlaceDetailPage({Key key, this.place}) : super(key: key);
  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  List<Marker> allMarkers = [];

  GoogleMapController _controller;
  PlaceDetailController _placeDetailController;

  @override
  void initState() {
    super.initState();
    _placeDetailController = Get.put(
      PlaceDetailController(),
    );
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(_placeDetailController.place.value.location.lat,
            _placeDetailController.place.value.location.lng)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
          detailPlacetwo(),
          //    detailMap(),
        ]));
  }

  Widget detailPlacetwo() {
    return Stack(
      children: <Widget>[
        Container(
            height: Get.height * 1.7,
            width: Get.width * 1.7,
            color: Colors.transparent),
        Container(
            height: Get.height - Get.height / 4,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(_placeDetailController.place.value.image),
                    fit: BoxFit.cover))),
        Container(
            height: Get.height - Get.height / 4,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.centerLeft,
                colors: [Colors.black54, Colors.transparent],
              ),
              //     borderRadius: BorderRadius.circular(40.0),
            )),
        Positioned(
            top: Get.height - Get.height / 4 - 25.0,
            child: Container(
              //  padding: EdgeInsets.all(20.0),
              height: Get.height * 1.5,
              width: Get.width,
              child: Stack(children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              _placeDetailController.place.value.location.lat,
                              _placeDetailController.place.value.location.lng),
                          zoom: 16.0),
                      markers: Set.from(allMarkers),
                      onMapCreated: mapCreated,
                    ),
                    height: Get.height * 0.85,
                    width: Get.width,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 65, bottom: 30),
                    child: Container(
                        height: Get.height * 0.3,
                        width: Get.width - 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 80,
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  margin: EdgeInsets.only(
                                      bottom: 20, right: 20, left: 20),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Row(
                                      //  children: [
                                      //  Icon(FontAwesomeIcons.mapMarkerAlt,
                                      //      size: 30, color: Colors.white),
                                      //  SizedBox(
                                      //     width: 5,
                                      //   ),
                                      Text(
                                        _placeDetailController
                                            .place.value.address,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: "IBMPlexSansKR-Bold",
                                            fontSize: 20),
                                      )
                                      //  ],
                                      //  )
                                    ],
                                  ))
                            ])))
              ]),
              decoration: BoxDecoration(
                  color: Color(0xFFFAF6ED),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
            )),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54.withOpacity(0.2)),
                      child: Center(
                        child: Icon(FontAwesomeIcons.chevronLeft,
                            size: 20, color: Colors.white70),
                      )))),
        ),
        Positioned(
          bottom:
              Get.height * 1.7 - (Get.height - Get.height / 4 - 25.0) + 20.0,
          left: 30,
          right: 30,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.utensilSpoon,
                          size: 30, color: Colors.white70),
                      SizedBox(width: 10.0),
                      Text(_placeDetailController.place.value.title,
                          style: TextStyle(
                              fontFamily: 'IBMPlexSansKR-Bold',
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 10.0),
                      Icon(FontAwesomeIcons.utensils,
                          size: 30, color: Colors.white70),
                      SizedBox(width: 10.0),
                    ]),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(_placeDetailController.place.value.description,
                      style: TextStyle(
                        fontFamily: 'IBMPlexSansKR-Medium',
                        //'GmarketSansLight',
                        fontSize: 20.0,
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 10.0),
                /*    Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.mapMarkerAlt,
                          size: 30, color: Colors.white70),
                      SizedBox(width: 10.0),
                      Text(_placeDetailController.place.value.address,
                          style: TextStyle(
                            fontFamily: 'IBMPlexSansKR-Medium',
                            fontSize: 20.0,
                            color: Colors.white,
                            //  fontWeight: FontWeight.bold
                          )),
                    ],
                  ),
                ),*/
                SizedBox(height: 10.0),
              ]),
        )
      ],
    );
  }

  Widget detailMap() {
    return Stack(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 30),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(_placeDetailController.place.value.location.lat,
                    _placeDetailController.place.value.location.lng),
                zoom: 16.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
          height: Get.height * 0.8,
          width: Get.width,
        ),
      ),
      Positioned(
          top: Get.height - Get.height / 3 - 25.0,
          child: Container(
            padding: EdgeInsets.only(left: 20.0),
            height: Get.height / 3 + 25.0,
            width: Get.width,
            decoration: BoxDecoration(
                color: Color(0xFFFAF6ED),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
          )),
    ]);
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
}
